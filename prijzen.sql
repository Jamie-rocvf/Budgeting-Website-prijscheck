-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Oct 19, 2026 at 07:31 AM
-- Server version: 12.2.2-MariaDB-ubu2404
-- PHP Version: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prijscheck`
--

-- --------------------------------------------------------

--
-- Table structure for table `prijzen`
--

CREATE TABLE `prijzen` (
  `product` text NOT NULL,
  `Class` text NOT NULL,
  `AH` float(11,2) NOT NULL,
  `Lidl` float(11,2) NOT NULL,
  `Jumbo` float(11,2) NOT NULL,
  `Vomar` float(11,2) NOT NULL,
  `Plus` float(11,2) NOT NULL,
  `Dirk` float(11,2) NOT NULL,
  `Aldi` float(11,2) NOT NULL,
  `Dekamarkt` float(11,2) NOT NULL,
  `Spar` float(11,2) NOT NULL,
  `Sligro` float(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
