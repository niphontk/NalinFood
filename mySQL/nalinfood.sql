-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 03, 2020 at 02:55 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nalinfood`
--

-- --------------------------------------------------------

--
-- Table structure for table `foodtable`
--

CREATE TABLE `foodtable` (
  `id` int(11) NOT NULL,
  `idShop` text DEFAULT NULL,
  `NameFood` text DEFAULT NULL,
  `PathImage` text DEFAULT NULL,
  `Price` text DEFAULT NULL,
  `Detail` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `foodtable`
--

INSERT INTO `foodtable` (`id`, `idShop`, `NameFood`, `PathImage`, `Price`, `Detail`) VALUES
(2, '6', 'Sugar', '/nalinfood/Food/food146296.jpg', '200', 'Sugar Detail Sugar Detail Sugar Detail Sugar Detail'),
(3, '6', 'Noodle', '/nalinfood/Food/food326833.jpg', '100', 'VeryGood'),
(4, '6', 'Crab', '/nalinfood/Food/food905636.jpg', '500', 'Crap Food');

-- --------------------------------------------------------

--
-- Table structure for table `ordertable`
--

CREATE TABLE `ordertable` (
  `id` int(11) NOT NULL,
  `OrderDateTime` text NOT NULL,
  `idShop` text NOT NULL,
  `NameShop` text NOT NULL,
  `Distance` text NOT NULL,
  `Transport` text NOT NULL,
  `idFood` text NOT NULL,
  `NameFood` text NOT NULL,
  `Price` text NOT NULL,
  `Amount` text NOT NULL,
  `Sum` text NOT NULL,
  `idRider` text NOT NULL,
  `Status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ordertable`
--

INSERT INTO `ordertable` (`id`, `OrderDateTime`, `idShop`, `NameShop`, `Distance`, `Transport`, `idFood`, `NameFood`, `Price`, `Amount`, `Sum`, `idRider`, `Status`) VALUES
(1, '2020-08-01 12:07:37', '6', 'NalinShop Huana', '0.91', '35', '[3, 4, 4]', 'NalinShop Huana', '[100, 500, 500]', '[3, 2, 1]', '[300, 1000, 500]', 'none', 'UserOrder'),
(2, '2020-08-01 12:15:31', '6', 'NalinShop Huana', '0.91', '35', '[3, 4]', 'NalinShop Huana', '[100, 500]', '[1, 1]', '[100, 500]', 'none', 'UserOrder');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `ChooseType` text DEFAULT NULL,
  `Name` text DEFAULT NULL,
  `User` text DEFAULT NULL,
  `Password` text DEFAULT NULL,
  `NameShop` text DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `Phone` text DEFAULT NULL,
  `urlPicture` text DEFAULT NULL,
  `Lat` text DEFAULT NULL,
  `Lng` text DEFAULT NULL,
  `Token` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `ChooseType`, `Name`, `User`, `Password`, `NameShop`, `Address`, `Phone`, `urlPicture`, `Lat`, `Lng`, `Token`) VALUES
(1, 'User', 'นิพนธ์', 'user1', '1234', 'NalinFood', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Rider', 'ผู้ส่งอาหาร', 'rider', '1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Shop', 'เจ้าของร้าน', 'shop', '1234', 'NalinShop Huana', '207 หมู่ที่ 8 โรงพยาบาลตระการพืชผล\r\nต.ขุหลุ  อ.ตระการพืชผล\r\nจ.อุบลราชธานี  34130', '0910139660', '/nalinfood/Shop/editShop97441.jpg', '15.613199', '105.025965', NULL),
(14, 'Shop', 'Niphon', 'niphon', '1234', 'NalinShop', '207 หมู่ที่ 8 โรงพยาบาลตระการพืชผล\r\nต.ขุหลุ  อ.ตระการพืชผล\r\nจ.อุบลราชธานี  34130', '0910139660', '/nalinfood/Shop/shop900814.jpg', '15.605501', '105.034139', ''),
(15, 'Shop', 'Salisa', 'salisa', '1234', 'Suksoomboon', 'Huana', '0885717810', '/nalinfood/Shop/shop838553.jpg', '15.612296', '105.043702', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `foodtable`
--
ALTER TABLE `foodtable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertable`
--
ALTER TABLE `ordertable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `foodtable`
--
ALTER TABLE `foodtable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ordertable`
--
ALTER TABLE `ordertable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
