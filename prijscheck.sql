-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Oct 26, 2026 at 11:47 AM
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
  `prijzen_ID` int(11) DEFAULT NULL,
  `toevoegproduct_ID` int(11) DEFAULT NULL,
  `afgevinkt` tinyint(1) NOT NULL DEFAULT 0
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
(53, 'Magere yoghurt 500g', 'Zuivel', 1.45, 1.15, 1.39, 1.45, 1.29, 1.13, 1.09, 1.19, 1.45, 1.02),
(54, 'Slagroom 250ml', 'Zuivel', 1.89, 1.49, 1.85, 1.89, 1.69, 1.45, 1.39, 1.55, 1.89, 1.29),
(55, 'Kwark 500g', 'Zuivel', 1.79, 1.39, 1.75, 1.79, 1.59, 1.35, 1.29, 1.49, 1.79, 1.25),
(56, 'Mozzarella 125g', 'Zuivel', 1.49, 0.99, 1.45, 1.49, 1.29, 0.95, 0.89, 1.09, 1.49, 0.85),
(57, 'Jonge kaas blokje 350g', 'Zuivel', 3.79, 3.29, 3.69, 3.75, 3.49, 3.19, 3.09, 3.39, 3.79, 2.99),
(58, 'Roomboter ongezouten 250g', 'Zuivel', 2.99, 2.49, 2.95, 2.99, 2.75, 2.45, 2.39, 2.59, 2.99, 2.29),
(59, 'IJs vanille 1L', 'Zuivel', 3.49, 2.79, 3.39, 3.49, 3.15, 2.69, 2.65, 2.95, 3.49, 2.45),
(60, 'Kipdijfilet 1kg', 'Vlees', 10.49, 8.99, 10.25, 10.39, 9.75, 8.69, 8.59, 9.19, 10.49, 8.25),
(61, 'Varkenshaas 500g', 'Vlees', 7.49, 6.49, 7.35, 7.45, 6.99, 6.25, 6.15, 6.69, 7.49, 5.95),
(62, 'Biefstuk 300g', 'Vlees', 8.99, 7.99, 8.85, 8.95, 8.45, 7.65, 7.55, 8.09, 8.99, 7.29),
(63, 'Spekblokjes 150g', 'Vlees', 1.99, 1.59, 1.95, 1.99, 1.79, 1.55, 1.49, 1.65, 1.99, 1.39),
(64, 'Kipnuggets 400g', 'Vlees', 3.99, 3.29, 3.89, 3.95, 3.59, 3.15, 3.09, 3.39, 3.99, 2.95),
(65, 'Zalm gerookt 100g', 'Overig', 3.29, 2.79, 3.25, 3.29, 2.99, 2.65, 2.59, 2.85, 3.29, 2.45),
(66, 'Haring 6 stuks', 'Overig', 2.99, 2.49, 2.95, 2.99, 2.69, 2.35, 2.29, 2.55, 2.99, 2.15),
(67, 'Broccoli 500g', 'Groente', 1.99, 1.49, 1.95, 1.99, 1.75, 1.45, 1.39, 1.55, 1.99, 1.25),
(68, 'Spinazie 300g', 'Groente', 1.79, 1.39, 1.75, 1.79, 1.59, 1.35, 1.29, 1.45, 1.79, 1.19),
(69, 'Wortels 1kg', 'Groente', 1.49, 0.99, 1.45, 1.49, 1.25, 0.95, 0.89, 1.09, 1.49, 0.85),
(70, 'Champignons 250g', 'Groente', 1.69, 1.29, 1.65, 1.69, 1.49, 1.19, 1.15, 1.35, 1.69, 1.05),
(71, 'Courgette stuk', 'Groente', 0.89, 0.69, 0.85, 0.89, 0.75, 0.65, 0.59, 0.69, 0.89, 0.55),
(72, 'Knoflook 3 stuks', 'Groente', 0.99, 0.69, 0.95, 0.99, 0.85, 0.65, 0.59, 0.75, 0.99, 0.55),
(73, 'Avocado stuk', 'Fruit', 1.29, 0.99, 1.25, 1.29, 1.09, 0.95, 0.89, 1.05, 1.29, 0.85),
(74, 'Druiven 500g', 'Fruit', 2.99, 2.49, 2.95, 2.99, 2.69, 2.35, 2.29, 2.55, 2.99, 2.15),
(75, 'Mandarijnen 1kg', 'Fruit', 2.79, 2.29, 2.75, 2.79, 2.49, 2.19, 2.15, 2.35, 2.79, 1.99),
(76, 'Peren 1kg', 'Fruit', 2.49, 1.99, 2.45, 2.49, 2.25, 1.95, 1.89, 2.09, 2.49, 1.79),
(77, 'Kiwi 4 stuks', 'Fruit', 2.29, 1.79, 2.25, 2.29, 1.99, 1.69, 1.65, 1.89, 2.29, 1.55),
(78, 'Volkorenbol 4 stuks', 'Brood', 2.49, 1.99, 2.45, 2.49, 2.25, 1.95, 1.89, 2.09, 2.49, 1.79),
(79, 'Stokbrood', 'Brood', 1.99, 1.49, 1.95, 1.99, 1.75, 1.45, 1.39, 1.59, 1.99, 1.29),
(80, 'Croissants 4 stuks', 'Brood', 2.79, 2.29, 2.75, 2.79, 2.49, 2.19, 2.15, 2.35, 2.79, 1.99),
(81, 'Ontbijtkoek 400g', 'Brood', 2.19, 1.79, 2.15, 2.19, 1.95, 1.69, 1.65, 1.85, 2.19, 1.55),
(82, 'Rozijnenbrood', 'Brood', 2.09, 1.69, 2.05, 2.09, 1.85, 1.59, 1.55, 1.75, 2.09, 1.45),
(83, 'Tortilla wraps 8 stuks', 'Brood', 2.39, 1.89, 2.35, 2.39, 2.09, 1.79, 1.75, 1.99, 2.39, 1.69),
(84, 'Penne 500g', 'Overig', 1.69, 1.19, 1.65, 1.69, 1.45, 1.13, 1.09, 1.29, 1.69, 0.99),
(85, 'Couscous 500g', 'Overig', 2.29, 1.79, 2.25, 2.29, 1.99, 1.69, 1.65, 1.85, 2.29, 1.55),
(86, 'Linzen 500g', 'Overig', 1.99, 1.49, 1.95, 1.99, 1.75, 1.45, 1.39, 1.59, 1.99, 1.29),
(87, 'Kikkererwten blik 400g', 'Overig', 1.19, 0.79, 1.15, 1.19, 0.99, 0.75, 0.69, 0.85, 1.19, 0.65),
(88, 'Tomatenblokjes blik 400g', 'Overig', 1.09, 0.69, 1.05, 1.09, 0.89, 0.65, 0.59, 0.75, 1.09, 0.55),
(89, 'Kokosmelk 400ml', 'Overig', 1.79, 1.39, 1.75, 1.79, 1.55, 1.29, 1.25, 1.45, 1.79, 1.19),
(90, 'Sojasaus 250ml', 'Overig', 1.89, 1.45, 1.85, 1.89, 1.65, 1.39, 1.35, 1.55, 1.89, 1.25),
(91, 'Olijfolie extra vierge 500ml', 'Overig', 6.49, 5.49, 6.35, 6.45, 5.95, 5.25, 5.15, 5.75, 6.49, 4.95),
(92, 'Mayonaise 500ml', 'Overig', 2.49, 1.99, 2.45, 2.49, 2.25, 1.95, 1.89, 2.09, 2.49, 1.79),
(93, 'Ketchup 500ml', 'Overig', 2.19, 1.69, 2.15, 2.19, 1.95, 1.65, 1.59, 1.85, 2.19, 1.49),
(94, 'Hagelslag puur 400g', 'Snacks', 2.79, 2.29, 2.75, 2.79, 2.49, 2.19, 2.15, 2.35, 2.79, 1.99),
(95, 'Popcorn zoet 100g', 'Snacks', 1.49, 0.99, 1.45, 1.49, 1.25, 0.95, 0.89, 1.09, 1.49, 0.85),
(96, 'Zoutjes pinda 150g', 'Snacks', 1.79, 1.29, 1.75, 1.79, 1.55, 1.25, 1.19, 1.39, 1.79, 1.09),
(97, 'Koekjes chocolade 300g', 'Snacks', 2.69, 2.19, 2.65, 2.69, 2.39, 2.09, 2.05, 2.25, 2.69, 1.89),
(98, 'Frisdrank cola zero 1,5L', 'Dranken', 2.29, 1.79, 2.25, 2.29, 2.05, 1.75, 1.69, 1.89, 2.29, 1.59),
(99, 'Appelsap 1L', 'Dranken', 2.09, 1.59, 2.05, 2.09, 1.85, 1.55, 1.49, 1.69, 2.09, 1.45),
(100, 'Chocolademelk 1L', 'Dranken', 1.99, 1.49, 1.95, 1.99, 1.75, 1.45, 1.39, 1.59, 1.99, 1.35),
(101, 'Pils 6-pack 330ml', 'Dranken', 7.99, 6.99, 7.85, 7.95, 7.25, 6.45, 6.35, 6.95, 7.99, 5.95),
(102, 'Rode wijn 750ml', 'Dranken', 6.49, 4.99, 6.35, 6.45, 5.75, 4.65, 4.55, 5.25, 6.49, 4.25);

-- --------------------------------------------------------

--
-- Table structure for table `toevoegproduct`
--

CREATE TABLE `toevoegproduct` (
  `user_ID` int(11) NOT NULL,
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
-- Dumping data for table `toevoegproduct`
--

INSERT INTO `toevoegproduct` (`user_ID`, `ID`, `product`, `Class`, `AH`, `Lidl`, `Jumbo`, `Vomar`, `Plus`, `Dirk`, `Aldi`, `Dekamarkt`, `Spar`, `Sligro`) VALUES
(1, 9, 'Chocoladepasta 400g', 'Overig', 3.49, 2.99, 3.45, 3.49, 3.15, 2.79, 2.69, 2.95, 3.49, 2.55),
(1, 10, 'Vegan burger 2 stuks', 'Vlees', 3.29, 2.79, 3.25, 3.29, 2.99, 2.65, 2.59, 2.85, 3.29, 2.45),
(1, 11, 'Havermelk 1L', 'Zuivel', 1.99, 1.49, 1.95, 1.99, 1.75, 1.45, 1.39, 1.59, 1.99, 1.29),
(1, 12, 'Pesto basilicum 130g', 'Overig', 2.29, 1.79, 2.25, 2.29, 1.99, 1.69, 1.65, 1.85, 2.29, 1.55),
(1, 13, 'Crème fraîche 200g', 'Zuivel', 1.69, 1.29, 1.65, 1.69, 1.49, 1.19, 1.15, 1.35, 1.69, 1.09),
(1, 14, 'Hummus 200g', 'Overig', 1.79, 1.39, 1.75, 1.79, 1.55, 1.29, 1.25, 1.45, 1.79, 1.19),
(1, 15, 'Kaneelbroodjes 4 stuks', 'Brood', 2.59, 2.09, 2.55, 2.59, 2.29, 1.99, 1.95, 2.19, 2.59, 1.89),
(1, 16, 'Tonijn in olie 185g', 'Overig', 1.89, 1.39, 1.85, 1.89, 1.65, 1.29, 1.25, 1.45, 1.89, 1.19),
(1, 17, 'Druivensap rood 1L', 'Dranken', 2.19, 1.69, 2.15, 2.19, 1.95, 1.59, 1.55, 1.75, 2.19, 1.49),
(1, 18, 'Bananenchips 150g', 'Snacks', 2.49, 1.99, 2.45, 2.49, 2.19, 1.89, 1.85, 2.05, 2.49, 1.75);

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
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `user`, `password`) VALUES
(1, 'test', 'test');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lijst`
--
ALTER TABLE `lijst`
  ADD UNIQUE KEY `uniq_lijst_prijzen` (`user_ID`,`prijzen_ID`),
  ADD UNIQUE KEY `uniq_lijst_toevoeg` (`user_ID`,`toevoegproduct_ID`),
  ADD KEY `idx_lijst_user` (`user_ID`),
  ADD KEY `fk_lijst_toevoegproduct` (`toevoegproduct_ID`),
  ADD KEY `idx_lijst_prijzen` (`prijzen_ID`);

--
-- Indexes for table `prijzen`
--
ALTER TABLE `prijzen`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `toevoegproduct`
--
ALTER TABLE `toevoegproduct`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_toevoegproduct_user` (`user_ID`);

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `toevoegproduct`
--
ALTER TABLE `toevoegproduct`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lijst`
--
ALTER TABLE `lijst`
  ADD CONSTRAINT `fk_lijst_prijzen` FOREIGN KEY (`prijzen_ID`) REFERENCES `prijzen` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_lijst_toevoegproduct` FOREIGN KEY (`toevoegproduct_ID`) REFERENCES `toevoegproduct` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_lijst_user` FOREIGN KEY (`user_ID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `toevoegproduct`
--
ALTER TABLE `toevoegproduct`
  ADD CONSTRAINT `fk_toevoegproduct_user` FOREIGN KEY (`user_ID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
