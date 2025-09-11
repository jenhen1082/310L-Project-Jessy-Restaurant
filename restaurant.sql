-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2025 at 07:08 PM
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
-- Table structure for table `product item`
--

CREATE TABLE `product item` (
  `ProductID` int(11) NOT NULL,
  `ProductName` text NOT NULL,
  `Product Description` text DEFAULT NULL,
  `Product Cost` int(11) NOT NULL,
  `Quantity in Cart` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product item`
--

INSERT INTO `product item` (`ProductID`, `ProductName`, `Product Description`, `Product Cost`, `Quantity in Cart`) VALUES
(1, 'chicken Taco', 'Corn tortilla with onion, cilantro, and Chiken.', 4, 0),
(2, 'Beef Taco', 'Corn tortilla with onion, cilantro, and Beef.', 4, 0),
(3, 'Chips & Salsa', 'Fresh basket of tortilla chips, and red salsa.', 1, 0),
(4, 'Rice & Beans', 'Side order of Rice and Beans.', 2, 0),
(5, 'Beef Burrito Supreme', 'Large flour tortilla, melted Oxaca cheese, filled with Chicken, rice, refriend beans, lettuce, tomato,and sour cream.\r\nCovered with tomatillo sauce, sprinkled with queso fresco.\r\nServed with a side of rice, refried beans and a small side salad.', 16, 0),
(6, 'Chicken Burrito Supreme', 'Large flour tortilla, melted Oxaca cheese, filled with Chicken, rice, refriend beans, lettuce, tomato,and sour cream.\r\nCovered with tomatillo sauce, sprinkled with queso fresco.\r\nServed with a side of rice, refried beans and a small side salad.', 16, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shopping cart`
--

CREATE TABLE `shopping cart` (
  `Shopping ID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `ProductName` int(11) NOT NULL,
  `Quantity Ordered` varchar(150) NOT NULL,
  `Product Cost` varchar(150) NOT NULL,
  `Product Total` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product item`
--
ALTER TABLE `product item`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indexes for table `shopping cart`
--
ALTER TABLE `shopping cart`
  ADD PRIMARY KEY (`Shopping ID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `shopping cart`
--
ALTER TABLE `shopping cart`
  ADD CONSTRAINT `shopping cart_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product item` (`ProductID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
