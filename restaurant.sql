-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2025 at 05:44 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `productitem`
--

CREATE TABLE `productitem` (
  `ProductID` int(11) NOT NULL,
  `ProductName` text NOT NULL,
  `ProductDescription` text DEFAULT NULL,
  `ProductCost` int(11) NOT NULL,
  `QuantityInCart` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productitem`
--

INSERT INTO `productitem` (`ProductID`, `ProductName`, `ProductDescription`, `ProductCost`, `QuantityInCart`) VALUES
(1, 'chicken Taco', 'Corn tortilla with onion, cilantro, and Chiken.', 4, 0),
(2, 'Beef Taco', 'Corn tortilla with onion, cilantro, and Beef.', 4, 0),
(3, 'Chips & Salsa', 'Fresh basket of tortilla chips, and red salsa.', 1, 0),
(4, 'Rice & Beans', 'Side order of Rice and Beans.', 2, 0),
(5, 'Beef Burrito Supreme', 'Large flour tortilla, melted Oxaca cheese, filled with Chicken, rice, refriend beans, lettuce, tomato,and sour cream.\r\nCovered with tomatillo sauce, sprinkled with queso fresco.\r\nServed with a side of rice, refried beans and a small side salad.', 16, 0),
(6, 'Chicken Burrito Supreme', 'Large flour tortilla, melted Oxaca cheese, filled with Chicken, rice, refriend beans, lettuce, tomato,and sour cream.\r\nCovered with tomatillo sauce, sprinkled with queso fresco.\r\nServed with a side of rice, refried beans and a small side salad.', 16, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `ShoppingID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `ProductTotal` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `productitem`
--
ALTER TABLE `productitem`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indexes for table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`ShoppingID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD CONSTRAINT `shoppingcart_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `productitem` (`ProductID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
