-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2023 at 04:53 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospitals`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrations`
--

CREATE TABLE `administrations` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_patien` int(11) UNSIGNED NOT NULL,
  `administration` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `medicine` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `inspection` decimal(20,6) NOT NULL DEFAULT 0.000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `administrations`
--

INSERT INTO `administrations` (`id`, `id_patien`, `administration`, `medicine`, `inspection`) VALUES
(1, 5, '90000.000000', '8000.000000', '10000.000000'),
(7, 4, '10000.000000', '40000.000000', '90000.000000');

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` int(11) UNSIGNED NOT NULL,
  `krs` date NOT NULL,
  `mrs` date NOT NULL,
  `no_mava` bigint(20) NOT NULL,
  `no_invoice` int(11) NOT NULL,
  `no_billing` bigint(20) NOT NULL,
  `jenis_rincian` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT '',
  `discount` int(11) DEFAULT NULL,
  `deposit` decimal(20,6) DEFAULT NULL,
  `id_employee` int(11) NOT NULL,
  `id_patien` int(11) UNSIGNED NOT NULL,
  `id_information` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `krs`, `mrs`, `no_mava`, `no_invoice`, `no_billing`, `jenis_rincian`, `status`, `discount`, `deposit`, `id_employee`, `id_patien`, `id_information`) VALUES
(8, '2023-11-24', '2023-11-24', 3213, 12, 23, 'biling pasien', 'lunas', 0, '0.000000', 2, 5, 2),
(13, '2023-11-24', '2023-11-24', 3213, 32, 24, 'billing pasien', 'lunas', 0, '0.000000', 2, 4, 2),
(17, '2023-11-24', '2023-11-24', 3233, 1, 2, 'billing pasien', 'lunas', 0, '0.000000', 2, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`) VALUES
(1, 'Pak iman'),
(2, 'Pak bahrul');

-- --------------------------------------------------------

--
-- Table structure for table `informations`
--

CREATE TABLE `informations` (
  `id` int(10) UNSIGNED NOT NULL,
  `address` text NOT NULL,
  `phone_number` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(150) NOT NULL DEFAULT '0',
  `fax` varchar(50) DEFAULT NULL,
  `no_rm` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `informations`
--

INSERT INTO `informations` (`id`, `address`, `phone_number`, `email`, `fax`, `no_rm`) VALUES
(1, 'jl malang', '123123', 'reda', '123', 123213),
(2, 'jl sudirman', '4213123', 'reno@gmail.com', '431', 1232);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `date_birth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `name`, `address`, `date_birth`) VALUES
(1, 'yatno', 'malang', '2023-11-24'),
(2, 'iwan', 'dampit', '2023-11-10'),
(3, 'qulbi', 'negbruk', '2023-11-12'),
(4, 'imam', 'jatim', '2023-11-11'),
(5, 'apis', 'kali pare', '2023-11-09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrations`
--
ALTER TABLE `administrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_patiens` (`id_patien`) USING BTREE;

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_employee` (`id_employee`),
  ADD KEY `id_patien` (`id_patien`),
  ADD KEY `id_information` (`id_information`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `informations`
--
ALTER TABLE `informations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrations`
--
ALTER TABLE `administrations`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `informations`
--
ALTER TABLE `informations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `administrations`
--
ALTER TABLE `administrations`
  ADD CONSTRAINT `FK_administrations_patiens` FOREIGN KEY (`id_patien`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `FK_bills_informations` FOREIGN KEY (`id_information`) REFERENCES `informations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_informations_employees` FOREIGN KEY (`id_employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_informations_patiens` FOREIGN KEY (`id_patien`) REFERENCES `patients` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
