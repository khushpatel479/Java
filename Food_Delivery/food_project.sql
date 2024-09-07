-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2024 at 05:12 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `img` varchar(50) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `email`, `name`, `img`, `price`) VALUES
(6, 'as@gmail.com', 'tomato pizza', 'p1.jpg.jpg', 1290),
(7, 'as@gmail.com', 'tomato pizza', 'p1.jpg.jpg', 1290),
(8, 'as@gmail.com', 'tomato pizza', 'p1.jpg.jpg', 1290),
(9, 'as@gmail.com', 'cheese pizza', 'p5.jpg', 1500),
(12, 'as@gmail.com', 'fgdfg', 'pasta.jpg', 232);

-- --------------------------------------------------------

--
-- Table structure for table `explore_item`
--

CREATE TABLE `explore_item` (
  `id` int(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `img` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `explore_item`
--

INSERT INTO `explore_item` (`id`, `name`, `img`) VALUES
(1, 'we', 'p1.jpg.jpg'),
(2, 'salad', '10.jpg'),
(3, 'pizza', '5.jpg'),
(4, 'desert', '10.jpg'),
(5, 'icecream', '4.png'),
(6, 'roti', 'service-1.jpg'),
(7, 'rolls', 'img3.jpg'),
(8, 'bhaat', 'SB23-Website Banner-2.png'),
(9, 'burger', 'p3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `food_items`
--

CREATE TABLE `food_items` (
  `id` int(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(50) NOT NULL,
  `description` varchar(300) NOT NULL,
  `explore_id` int(50) NOT NULL,
  `img` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `food_items`
--

INSERT INTO `food_items` (`id`, `name`, `price`, `description`, `explore_id`, `img`) VALUES
(2, 'tomato pizza', 1290, 'Full Of Pizza With tomato', 3, 'p1.jpg.jpg'),
(3, 'cheese pizza', 1500, 'Full of cheese', 3, 'p5.jpg'),
(4, 'new_pizze', 1230, 'sdfsdfsdfsfvdfbdb', 3, 'p4.jpg'),
(5, 'ddf', 123, 'sdfsf', 3, 'p5.jpg'),
(6, 'fgdfg', 232, 'dfgdg', 3, 'pasta.jpg'),
(7, 'fgdfg', 232, 'dfgdg', 3, 'eiliv-aceron-M-pEl_nv1Q0-unsplash.jpg'),
(8, 'sdfgg', 34, 'gfhfgh', 4, 'pizza-2068272_1280.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `place_order`
--

CREATE TABLE `place_order` (
  `id` int(50) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `street` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zipcode` int(90) NOT NULL,
  `country` varchar(100) NOT NULL,
  `phone` int(200) NOT NULL,
  `order_id` int(90) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `id` int(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`id`, `name`, `email`, `pass`) VALUES
(1, 'khush', 'ac@gmail.com', 'abc');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `explore_item`
--
ALTER TABLE `explore_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_items`
--
ALTER TABLE `food_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `explore_id` (`explore_id`);

--
-- Indexes for table `place_order`
--
ALTER TABLE `place_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `signup`
--
ALTER TABLE `signup`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `explore_item`
--
ALTER TABLE `explore_item`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `food_items`
--
ALTER TABLE `food_items`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `place_order`
--
ALTER TABLE `place_order`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `signup`
--
ALTER TABLE `signup`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `food_items`
--
ALTER TABLE `food_items`
  ADD CONSTRAINT `food_items_ibfk_1` FOREIGN KEY (`explore_id`) REFERENCES `explore_item` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
