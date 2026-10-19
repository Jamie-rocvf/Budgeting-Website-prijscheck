-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Oct 19, 2026 at 08:16 AM
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
-- Table structure for table `lijst`
--

CREATE TABLE `lijst` (
  `user_ID` int(11) NOT NULL,
  `prijzen_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lijst_backup`
--

CREATE TABLE `lijst_backup` (
  `user_ID` int(11) NOT NULL,
  `prijzen_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prijzen`
--

CREATE TABLE `prijzen` (
  `ID` int(11) NOT NULL,
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

--
-- Dumping data for table `prijzen`
--

INSERT INTO `prijzen` (`ID`, `product`, `Class`, `AH`, `Lidl`, `Jumbo`, `Vomar`, `Plus`, `Dirk`, `Aldi`, `Dekamarkt`, `Spar`, `Sligro`) VALUES
(1, 'Volle melk 1L', 'Zuivel', 1.29, 1.09, 1.25, 1.29, 1.19, 1.09, 1.05, 1.15, 1.29, 0.99),
(2, 'Halfvolle melk 1L', 'Zuivel', 1.19, 0.99, 1.15, 1.19, 1.09, 0.99, 0.95, 1.05, 1.19, 0.89),
(3, 'Karnemelk 1L', 'Zuivel', 1.09, 0.89, 1.05, 1.09, 0.99, 0.89, 0.85, 0.95, 1.09, 0.79),
(4, 'Jonge kaas 48+ 500g', 'Kaas', 4.49, 3.99, 4.39, 4.45, 4.19, 3.89, 3.79, 4.09, 4.49, 3.59),
(5, 'Oude kaas 48+ 500g', 'Kaas', 5.29, 4.79, 5.19, 5.25, 4.99, 4.69, 4.59, 4.89, 5.29, 4.49),
(6, 'Goudse plakken 200g', 'Kaas', 2.39, 2.09, 2.35, 2.39, 2.19, 2.05, 1.99, 2.15, 2.39, 1.95),
(7, 'Roomboter 250g', 'Zuivel', 2.99, 2.49, 2.95, 2.99, 2.75, 2.45, 2.39, 2.59, 2.99, 2.29),
(8, 'Eieren 10 stuks', 'Zuivel', 3.09, 2.79, 3.05, 3.09, 2.89, 2.75, 2.65, 2.85, 3.09, 2.55),
(9, 'Yoghurt naturel 500g', 'Zuivel', 1.49, 1.19, 1.45, 1.49, 1.35, 1.19, 1.15, 1.25, 1.49, 1.05),
(10, 'Vla vanille 500ml', 'Zuivel', 1.39, 1.09, 1.35, 1.39, 1.25, 1.09, 1.05, 1.15, 1.39, 0.99),
(11, 'Witbrood heel', 'Brood', 1.79, 1.39, 1.75, 1.79, 1.59, 1.35, 1.29, 1.49, 1.79, 1.19),
(12, 'Volkorenbrood heel', 'Brood', 2.19, 1.79, 2.15, 2.19, 1.99, 1.75, 1.69, 1.89, 2.19, 1.59),
(13, 'Crackers 200g', 'Brood', 1.69, 1.29, 1.65, 1.69, 1.49, 1.25, 1.19, 1.39, 1.69, 1.09),
(14, 'Beschuit 250g', 'Brood', 1.99, 1.59, 1.95, 1.99, 1.79, 1.55, 1.49, 1.69, 1.99, 1.39),
(15, 'Rijst 1kg', 'Droogwaar', 2.49, 1.99, 2.45, 2.49, 2.25, 1.95, 1.89, 2.09, 2.49, 1.79),
(16, 'Spaghetti 500g', 'Droogwaar', 1.49, 0.99, 1.45, 1.49, 1.25, 0.95, 0.89, 1.09, 1.49, 0.79),
(17, 'Macaroni 500g', 'Droogwaar', 1.49, 0.99, 1.45, 1.49, 1.25, 0.95, 0.89, 1.09, 1.49, 0.79),
(18, 'Havermout 500g', 'Droogwaar', 1.99, 1.49, 1.95, 1.99, 1.75, 1.45, 1.39, 1.59, 1.99, 1.29),
(19, 'Bloem 1kg', 'Droogwaar', 1.29, 0.99, 1.25, 1.29, 1.15, 0.95, 0.89, 1.05, 1.29, 0.85),
(20, 'Suiker 1kg', 'Droogwaar', 1.59, 1.19, 1.55, 1.59, 1.39, 1.15, 1.09, 1.25, 1.59, 0.99),
(21, 'Pindakaas 350g', 'Beleg', 2.49, 1.99, 2.45, 2.49, 2.19, 1.95, 1.89, 2.09, 2.49, 1.79),
(22, 'Hagelslag melk 400g', 'Beleg', 2.39, 1.89, 2.35, 2.39, 2.09, 1.85, 1.79, 1.99, 2.39, 1.69),
(23, 'Jam aardbei 450g', 'Beleg', 2.79, 2.29, 2.75, 2.79, 2.49, 2.19, 2.15, 2.35, 2.79, 1.99),
(24, 'Appelstroop 450g', 'Beleg', 2.59, 2.09, 2.55, 2.59, 2.29, 1.99, 1.95, 2.19, 2.59, 1.85),
(25, 'Kipfilet 500g', 'Vlees', 6.99, 5.99, 6.85, 6.95, 6.49, 5.79, 5.69, 6.19, 6.99, 5.49),
(26, 'Gehakt half om half 500g', 'Vlees', 4.99, 4.29, 4.89, 4.95, 4.59, 4.19, 4.09, 4.39, 4.99, 3.95),
(27, 'Rundergehakt 500g', 'Vlees', 5.99, 5.29, 5.89, 5.95, 5.59, 5.15, 5.05, 5.39, 5.99, 4.89),
(28, 'Schnitzel kip 2 stuks', 'Vlees', 4.49, 3.99, 4.39, 4.45, 4.19, 3.85, 3.79, 4.09, 4.49, 3.59),
(29, 'Gekookte ham 150g', 'Vlees', 2.29, 1.89, 2.25, 2.29, 2.05, 1.85, 1.79, 1.95, 2.29, 1.69),
(30, 'Rookworst 300g', 'Vlees', 3.29, 2.79, 3.25, 3.29, 2.99, 2.69, 2.65, 2.85, 3.29, 2.49),
(31, 'Zalmfilet 200g', 'Vis', 5.49, 4.79, 5.39, 5.45, 4.99, 4.59, 4.49, 4.89, 5.49, 4.29),
(32, 'Kibbeling 300g', 'Vis', 3.99, 3.49, 3.95, 3.99, 3.69, 3.39, 3.29, 3.59, 3.99, 3.19),
(33, 'Tomaten 500g', 'Groente', 1.99, 1.49, 1.95, 1.99, 1.79, 1.45, 1.39, 1.59, 1.99, 1.25),
(34, 'Komkommer stuk', 'Groente', 0.99, 0.69, 0.95, 0.99, 0.85, 0.65, 0.65, 0.75, 0.99, 0.55),
(35, 'Paprika rood stuk', 'Groente', 0.89, 0.69, 0.85, 0.89, 0.79, 0.65, 0.59, 0.75, 0.89, 0.55),
(36, 'Uien 1kg', 'Groente', 1.79, 1.29, 1.75, 1.79, 1.55, 1.25, 1.19, 1.39, 1.79, 1.09),
(37, 'Aardappelen 2,5kg', 'Groente', 3.49, 2.79, 3.45, 3.49, 3.15, 2.69, 2.59, 2.89, 3.49, 2.39),
(38, 'Sla iceberg stuk', 'Groente', 1.29, 0.89, 1.25, 1.29, 1.09, 0.85, 0.79, 0.95, 1.29, 0.75),
(39, 'Bananen 1kg', 'Fruit', 1.99, 1.59, 1.95, 1.99, 1.79, 1.55, 1.49, 1.65, 1.99, 1.39),
(40, 'Appels Elstar 1kg', 'Fruit', 2.79, 2.29, 2.75, 2.79, 2.49, 2.19, 2.15, 2.35, 2.79, 1.99),
(41, 'Sinaasappels 1kg', 'Fruit', 2.49, 1.99, 2.45, 2.49, 2.25, 1.95, 1.89, 2.09, 2.49, 1.79),
(42, 'Aardbeien 500g', 'Fruit', 3.29, 2.79, 3.25, 3.29, 2.99, 2.69, 2.65, 2.85, 3.29, 2.49),
(43, 'Cola 1,5L', 'Drank', 2.29, 1.79, 2.25, 2.29, 2.05, 1.75, 1.69, 1.89, 2.29, 1.59),
(44, 'Sinas 1,5L', 'Drank', 1.99, 1.49, 1.95, 1.99, 1.79, 1.45, 1.39, 1.59, 1.99, 1.35),
(45, 'Jus d\'orange 1L', 'Drank', 2.49, 1.99, 2.45, 2.49, 2.19, 1.95, 1.89, 2.09, 2.49, 1.79),
(46, 'Water bruisend 1,5L', 'Drank', 0.99, 0.59, 0.95, 0.99, 0.79, 0.55, 0.55, 0.65, 0.99, 0.49),
(47, 'Koffie snelfilter 500g', 'Drank', 6.99, 5.49, 6.85, 6.95, 6.25, 5.29, 5.19, 5.85, 6.99, 4.99),
(48, 'Thee zwarte 40 zakjes', 'Drank', 2.99, 2.29, 2.95, 2.99, 2.65, 2.19, 2.15, 2.45, 2.99, 1.99),
(49, 'Chips paprika 175g', 'Snacks', 1.99, 1.49, 1.95, 1.99, 1.75, 1.45, 1.39, 1.59, 1.99, 1.29),
(50, 'Chocoladerepen 3x100g', 'Snacks', 3.49, 2.79, 3.45, 3.49, 3.15, 2.69, 2.65, 2.95, 3.49, 2.49),
(51, 'Toiletpapier 8 rollen', 'Huishouden', 4.99, 3.99, 4.89, 4.95, 4.45, 3.79, 3.69, 4.25, 4.99, 3.49),
(52, 'Vaatwastabletten 40st', 'Huishouden', 7.99, 6.49, 7.85, 7.95, 7.25, 6.15, 6.05, 6.85, 7.99, 5.79);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `user` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `prijzen`
--
ALTER TABLE `prijzen`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `prijzen`
--
ALTER TABLE `prijzen`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
