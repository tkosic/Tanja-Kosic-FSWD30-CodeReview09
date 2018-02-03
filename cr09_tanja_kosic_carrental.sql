-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2018 at 05:45 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_tanja_kosic_carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `add_charge`
--

CREATE TABLE `add_charge` (
  `add_charge_id` int(11) NOT NULL,
  `fk_return_id` int(11) DEFAULT NULL,
  `payment` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `add_charge`
--

INSERT INTO `add_charge` (`add_charge_id`, `fk_return_id`, `payment`) VALUES
(1, 1, 0),
(2, 2, 86.4),
(3, 3, 0),
(4, 4, 640.6),
(5, 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`car_id`, `model`, `type`, `color`) VALUES
(1, 'FIAT 500', 'small car', 'red'),
(2, 'VW Passat CC', 'large car', 'silver'),
(3, 'Mercedes G-Class', 'SUV', 'black'),
(4, 'Toyota Sienna', 'mini van', 'silver'),
(5, 'Audi R8', 'sports car', 'red');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `drivers_licens` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `credit_card` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `address`, `phone`, `drivers_licens`, `email`, `credit_card`) VALUES
(1, 'Mark', 'Foster', 'Klimschgasse 3/6; 1030 Vienna; Austria', 25595184, '1584a4s8d845', 'mark@email.bum', 2147483647),
(2, 'Maria', 'Maric', 'Landstrasse 12/14; 1030 Vienna; Austria', 42585882, '1384a4s8d946', 'maria@email.bum', 2147483647),
(3, 'Tanja', 'Simons', 'Ludwiggasse 1/13; 1050 Vienna; Austria', 255525651, '2583a4s8d865', 'tanja@email.bum', 2147483647),
(4, 'Sanja', 'Gregory', 'Erlachgasse 24/31; 1100 Vienna; Austria', 65598183, '8584b4s8dl95', 'sanja@email.bum', 2147483647),
(5, 'Ella', 'Foster', 'Marianistrasse 4/34; 1170 Vienna; Austria', 825295181, '1484a4n8d844', 'ella@email.bum', 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `day` datetime DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `day`, `payment_status`) VALUES
(1, '2017-12-22 14:16:44', 'processed'),
(2, '2018-01-23 11:13:14', 'processed'),
(3, '2018-02-01 13:02:04', 'cancelled'),
(4, '2018-01-14 09:21:55', 'processed'),
(5, '2017-12-30 18:16:41', 'cancelled');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `fk_invoice_id` int(11) DEFAULT NULL,
  `fk_start_id` int(11) DEFAULT NULL,
  `fk_return_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `fk_customer_id`, `fk_car_id`, `fk_invoice_id`, `fk_start_id`, `fk_return_id`) VALUES
(1, 5, 1, 2, 4, 4),
(2, 1, 4, 3, 5, 5),
(3, 2, 2, 4, 3, 3),
(4, 3, 5, 5, 2, 2),
(5, 4, 3, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `return_location`
--

CREATE TABLE `return_location` (
  `return_id` int(11) NOT NULL,
  `fk_add_charge` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `drop_off` datetime DEFAULT NULL,
  `demages` varchar(255) DEFAULT NULL,
  `tank` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `return_location`
--

INSERT INTO `return_location` (`return_id`, `fk_add_charge`, `address`, `phone`, `drop_off`, `demages`, `tank`) VALUES
(1, 1, 'Thomasgasse 12; Vienna 1020; Austria', 1236548, '2018-01-05 18:00:00', 'no demages', 'tank full'),
(2, 2, 'Barichgasse 31; Vienna 1030; Austria', 1554893, '2018-01-06 19:15:00', 'no demages', 'tank empty'),
(3, 3, 'Thomasgasse 12; Vienna 1020; Austria', 1236548, '2018-01-21 12:00:00', 'no demages', 'tank full'),
(4, 4, 'Thomasgasse 12; Vienna 1020; Austria', 1236548, '2018-01-30 16:30:00', '4 screeches on the left front door', 'tank full'),
(5, 5, 'Barichgasse 31; Vienna 1030; Austria', 1554893, '2018-02-10 14:30:00', 'no demages', 'tank full');

-- --------------------------------------------------------

--
-- Table structure for table `start_location`
--

CREATE TABLE `start_location` (
  `start_id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `pick_up` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `start_location`
--

INSERT INTO `start_location` (`start_id`, `address`, `phone`, `pick_up`) VALUES
(1, 'Thomasgasse 12; Vienna 1020; Austria', 1236548, '2017-12-25 08:00:00'),
(2, 'Barichgasse 31; Vienna 1030; Austria', 1554893, '2017-12-31 09:15:00'),
(3, 'Thomasgasse 12; Vienna 1020; Austria', 1236548, '2018-01-14 10:30:00'),
(4, 'Thomasgasse 12; Vienna 1020; Austria', 1236548, '2018-01-25 07:30:00'),
(5, 'Barichgasse 31; Vienna 1030; Austria', 1554893, '2018-02-04 14:30:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `add_charge`
--
ALTER TABLE `add_charge`
  ADD PRIMARY KEY (`add_charge_id`),
  ADD KEY `fk_return_id` (`fk_return_id`) USING BTREE;

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_car_id` (`fk_car_id`),
  ADD KEY `fk_invoice_id` (`fk_invoice_id`),
  ADD KEY `fk_start_id` (`fk_start_id`),
  ADD KEY `fk_return_id` (`fk_return_id`);

--
-- Indexes for table `return_location`
--
ALTER TABLE `return_location`
  ADD PRIMARY KEY (`return_id`),
  ADD KEY `fk_add_charge` (`fk_add_charge`);

--
-- Indexes for table `start_location`
--
ALTER TABLE `start_location`
  ADD PRIMARY KEY (`start_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `add_charge`
--
ALTER TABLE `add_charge`
  ADD CONSTRAINT `add_charge_ibfk_1` FOREIGN KEY (`fk_return_id`) REFERENCES `return_location` (`return_id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`fk_invoice_id`) REFERENCES `invoice` (`invoice_id`),
  ADD CONSTRAINT `reservation_ibfk_4` FOREIGN KEY (`fk_start_id`) REFERENCES `start_location` (`start_id`),
  ADD CONSTRAINT `reservation_ibfk_5` FOREIGN KEY (`fk_return_id`) REFERENCES `return_location` (`return_id`);

--
-- Constraints for table `return_location`
--
ALTER TABLE `return_location`
  ADD CONSTRAINT `return_location_ibfk_1` FOREIGN KEY (`fk_add_charge`) REFERENCES `add_charge` (`add_charge_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
