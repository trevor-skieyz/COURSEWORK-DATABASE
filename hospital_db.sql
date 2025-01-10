-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2025 at 11:38 PM
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
-- Database: `hospital_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_facility_type`
--

CREATE TABLE `tbl_facility_type` (
  `Facility_Type_id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Description` text DEFAULT NULL,
  `Date_Added` date NOT NULL DEFAULT current_timestamp(),
  `Date_Updated` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_facilit_type`
--

CREATE TABLE `tbl_facilit_type` (
  `Facility_Type_id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Description` text DEFAULT NULL,
  `Date_Added` date NOT NULL,
  `Date_Updated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_health_facility`
--

CREATE TABLE `tbl_health_facility` (
  `Facility_id` int(11) NOT NULL,
  `Facility_Name` varchar(100) NOT NULL,
  `Facity_Type` int(11) DEFAULT NULL,
  `Capacity` int(11) NOT NULL,
  `Contact_Details` varchar(10) DEFAULT NULL,
  `Date_Added` date NOT NULL DEFAULT current_timestamp(),
  `Facility_head` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_labaratory_tests`
--

CREATE TABLE `tbl_labaratory_tests` (
  `Test_id` int(11) NOT NULL,
  `Case_id` int(11) NOT NULL,
  `Test_Type` varchar(50) NOT NULL,
  `Test_Result` varchar(50) NOT NULL,
  `Test_Date` date NOT NULL,
  `Technician_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_malaria_cases`
--

CREATE TABLE `tbl_malaria_cases` (
  `Case_id` int(11) NOT NULL,
  `Patient_id` int(11) NOT NULL,
  `Facility_id` int(11) NOT NULL,
  `Date_Of_Diagnosis` date NOT NULL DEFAULT current_timestamp(),
  `Type_of_malaria` varchar(50) NOT NULL,
  `Treatment_id` int(11) NOT NULL,
  `Outcome_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_malaria_type`
--

CREATE TABLE `tbl_malaria_type` (
  `Type_id` int(11) NOT NULL,
  `Type_Name` varchar(50) NOT NULL,
  `Description` text NOT NULL,
  `Date_added` date NOT NULL DEFAULT current_timestamp(),
  `Added_by` int(11) DEFAULT NULL,
  `Update_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_patient_data`
--

CREATE TABLE `tbl_patient_data` (
  `Patient_id` int(11) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Date_Of_Birth` date NOT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Phone_Number` varchar(10) DEFAULT NULL,
  `Next_Of_Kin` varchar(100) NOT NULL,
  `Location` varchar(50) NOT NULL,
  `Date_Added` date NOT NULL DEFAULT current_timestamp(),
  `Update_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_patient_data`
--

INSERT INTO `tbl_patient_data` (`Patient_id`, `First_Name`, `Last_Name`, `Date_Of_Birth`, `Gender`, `Phone_Number`, `Next_Of_Kin`, `Location`, `Date_Added`, `Update_date`) VALUES
(1, 'Alex ', 'Bakulu', '2004-12-01', 'M', '070678765', '', '12', '2025-01-10', '2025-01-10'),
(2, 'Kato', 'Isma', '2000-12-11', 'M', '0785363522', '', 'MBARARA', '2025-01-10', '2025-01-10'),
(4, 'Alice', 'Grace', '2024-07-07', 'F', '0775242314', '', 'Kampala', '2025-01-10', '2025-01-10');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_staff`
--

CREATE TABLE `tbl_staff` (
  `staff_id` int(11) NOT NULL,
  `Staff_Name` varchar(50) NOT NULL,
  `Facility_id` int(11) NOT NULL,
  `Date_of_birth` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_treatment`
--

CREATE TABLE `tbl_treatment` (
  `Treatment_id` int(11) NOT NULL,
  `Treatment_Name` varchar(500) NOT NULL,
  `Treatment_Description` text NOT NULL,
  `Dosage` varchar(50) NOT NULL,
  `Side_Effects` text NOT NULL,
  `Date_Added` date NOT NULL,
  `Update_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_treatment_outcomes`
--

CREATE TABLE `tbl_treatment_outcomes` (
  `Outcome_id` int(11) NOT NULL,
  `OUtcome_Name` varchar(50) NOT NULL,
  `Outcome_Description` text NOT NULL,
  `Date_Added` date NOT NULL,
  `Added_by` int(11) NOT NULL,
  `Update_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_visit_records`
--

CREATE TABLE `tbl_visit_records` (
  `Visit_id` int(11) NOT NULL,
  `Patient_id` int(11) NOT NULL,
  `Visit_Number` int(11) NOT NULL,
  `Visit_Date` date NOT NULL,
  `Date_Added` date NOT NULL,
  `Update_date` date NOT NULL,
  `Facility_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_facility_type`
--
ALTER TABLE `tbl_facility_type`
  ADD PRIMARY KEY (`Facility_Type_id`);

--
-- Indexes for table `tbl_facilit_type`
--
ALTER TABLE `tbl_facilit_type`
  ADD PRIMARY KEY (`Facility_Type_id`);

--
-- Indexes for table `tbl_health_facility`
--
ALTER TABLE `tbl_health_facility`
  ADD PRIMARY KEY (`Facility_id`),
  ADD UNIQUE KEY `Capacity` (`Capacity`),
  ADD UNIQUE KEY `Contact_Details` (`Contact_Details`);

--
-- Indexes for table `tbl_labaratory_tests`
--
ALTER TABLE `tbl_labaratory_tests`
  ADD PRIMARY KEY (`Test_id`),
  ADD UNIQUE KEY `Case_id` (`Case_id`),
  ADD UNIQUE KEY `Technician_id` (`Technician_id`);

--
-- Indexes for table `tbl_malaria_cases`
--
ALTER TABLE `tbl_malaria_cases`
  ADD PRIMARY KEY (`Case_id`),
  ADD UNIQUE KEY `Patient_id` (`Patient_id`),
  ADD UNIQUE KEY `Facility_id` (`Facility_id`),
  ADD UNIQUE KEY `Treatment_id` (`Treatment_id`),
  ADD UNIQUE KEY `Outcome_id` (`Outcome_id`);

--
-- Indexes for table `tbl_malaria_type`
--
ALTER TABLE `tbl_malaria_type`
  ADD PRIMARY KEY (`Type_id`),
  ADD UNIQUE KEY `Added_by` (`Added_by`);

--
-- Indexes for table `tbl_patient_data`
--
ALTER TABLE `tbl_patient_data`
  ADD PRIMARY KEY (`Patient_id`),
  ADD UNIQUE KEY `Phone_Number` (`Phone_Number`);
ALTER TABLE `tbl_patient_data` ADD FULLTEXT KEY `Gender` (`Gender`);

--
-- Indexes for table `tbl_staff`
--
ALTER TABLE `tbl_staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `Added_by` (`Facility_id`),
  ADD UNIQUE KEY `Facility_id` (`Facility_id`);

--
-- Indexes for table `tbl_treatment`
--
ALTER TABLE `tbl_treatment`
  ADD PRIMARY KEY (`Treatment_id`);

--
-- Indexes for table `tbl_treatment_outcomes`
--
ALTER TABLE `tbl_treatment_outcomes`
  ADD PRIMARY KEY (`Outcome_id`);

--
-- Indexes for table `tbl_visit_records`
--
ALTER TABLE `tbl_visit_records`
  ADD PRIMARY KEY (`Visit_id`),
  ADD UNIQUE KEY `Patient_id` (`Patient_id`),
  ADD UNIQUE KEY `Facility_id` (`Facility_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_facility_type`
--
ALTER TABLE `tbl_facility_type`
  MODIFY `Facility_Type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_facilit_type`
--
ALTER TABLE `tbl_facilit_type`
  MODIFY `Facility_Type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_health_facility`
--
ALTER TABLE `tbl_health_facility`
  MODIFY `Facility_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_labaratory_tests`
--
ALTER TABLE `tbl_labaratory_tests`
  MODIFY `Test_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_malaria_cases`
--
ALTER TABLE `tbl_malaria_cases`
  MODIFY `Case_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_malaria_type`
--
ALTER TABLE `tbl_malaria_type`
  MODIFY `Type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_patient_data`
--
ALTER TABLE `tbl_patient_data`
  MODIFY `Patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_staff`
--
ALTER TABLE `tbl_staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_treatment`
--
ALTER TABLE `tbl_treatment`
  MODIFY `Treatment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_treatment_outcomes`
--
ALTER TABLE `tbl_treatment_outcomes`
  MODIFY `Outcome_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_visit_records`
--
ALTER TABLE `tbl_visit_records`
  MODIFY `Visit_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
