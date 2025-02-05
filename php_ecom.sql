-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2025 at 07:31 AM
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
-- Database: `php_ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `new product`
--

CREATE TABLE `new product` (
  `Prod_Id` int(200) NOT NULL,
  `Prod_Name` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `new product`
--

INSERT INTO `new product` (`Prod_Id`, `Prod_Name`) VALUES
(1, 'Router');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `price` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `title`, `price`, `image`, `username`, `email`, `phone`, `address`, `status`) VALUES
(1, 'laptop', '1049', '1725374561.jpg', 'test', 'test@gmail.com', '015484512', 'test', 'Delivered'),
(2, 'Watch', '599', '1725374663.webp', 'test', 'test@gmail.com', '015484512', 'test', 'Delivered'),
(3, 'camera', '330', '1725374772.jpg', 'test', 'test@gmail.com', '015484512', 'test', 'Delivered'),
(11, 'Makeup ', '580', '1725375028.jpg', 'yamin', 'yamin@gmail.com', '234567', 'dhaka , bangladesh', 'Delivered'),
(12, 'camera', '330', '1725374772.jpg', 'yamin', 'yamin@gmail.com', '234567', 'dhaka , bangladesh', 'Delivered'),
(21, 'laptop', '1049', '1725374561.jpg', 'yamin', 'yamin@gmail.com', '234567', 'dhaka , bangladesh', 'In progress'),
(22, 'laptop', '1049', '1725374561.jpg', 'yamin', 'yamin@gmail.com', '234567', 'dhaka , bangladesh', 'In progress'),
(23, 'laptop', '1049', '1725374561.jpg', 'test', 'test@gmail.com', '015484512', 'test', 'In progress'),
(24, 'laptop', '1049', '1725374561.jpg', 'user', 'user@gmail.com', '12345678', 'germany', 'In progress'),
(25, 'Watch', '599', '1725374663.webp', 'user', 'user@gmail.com', '12345678', 'germany', 'In progress'),
(26, 'Makeup ', '580', '1725375028.jpg', 'adam', 'adam@gmail.com', '1234567', 'india', 'In progress'),
(27, 'laptop', '1049', '1725374561.jpg', 'adam', 'adam@gmail.com', '1234567', 'india', 'In progress'),
(28, 'laptop', '1049', '1725374561.jpg', 'adam', 'adam@gmail.com', '1234567', 'india', 'In progress'),
(29, 'camera', '330', '1725374772.jpg', 'user', 'user@gmail.com', '12345678', 'germany', 'In progress'),
(30, 'Mobile', '499', '1725374753.jpeg', 'user', 'user@gmail.com', '12345678', 'germany', 'In progress'),
(31, 'Black T Shirt', '39', '1725374617.jpeg', 'yamin', 'yamin@gmail.com', '234567', 'dhaka , bangladesh', 'In progress'),
(32, 'Watch', '599', '1725374663.webp', 'test', 'test@gmail.com', '015484512', 'test', 'In progress'),
(33, 'camera', '330', '1725374772.jpg', 'YG', 'yashng23648@gmail.com', '7776965420', 'kedgaon', 'In progress'),
(34, 'Mobile', '499', '1725374753.jpeg', 'mayur', 'mayur23648@gmail.com', '1234567895', 'Shriram colony Kedgaon, near nisha palace hotel', 'In progress');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `price` varchar(50) NOT NULL,
  `quantity` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `price`, `quantity`, `image`) VALUES
(2, 'Makeup ', 'cosmetics such as lipstick or powder applied to the face, used to enhance or alter the appearance', '580', '110', '1725375028.jpg'),
(5, 'camera', 'black camera																										', '330', '5', '1725374772.jpg'),
(6, 'laptop', 'Laptops are compact, portable versions of full-fledged Desktop Computers. ', '1049', '120', '1725374561.jpg'),
(7, 'Black T Shirt', 'Complete Your Wardrobe with a Black Cotton Combo T-Shirt & Pant for Men - T-Shirt for Men - Very Comfortable and Fashionable', '39', '500', '1725374617.jpeg'),
(8, 'Watch', 'Rolex watches are crafted from the finest raw materials and assembled with scrupulous attention to detail. ', '599', '50', '1725374663.webp'),
(9, 'Mobile', 'hen something is mobile it can move or be moved easily. If you walk to the end of the block talking on your cell phone, you are a mobile being using a mobile device.', '499', '120', '1725374753.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `usertype` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone`, `address`, `usertype`) VALUES
(1, 'test', 'test@gmail.com', '12345678', '015484512', 'test', 'user'),
(4, 'admin', 'admin@gmail.com', '123456', '258520', 'canda', 'admin'),
(8, 'user', 'user@gmail.com', '12345678', '12345678', 'germany', 'user'),
(9, 'yamin', 'yamin@gmail.com', '12345678', '234567', 'dhaka , bangladesh', 'user'),
(10, 'adam', 'adam@gmail.com', '12345678', '1234567', 'india', 'user'),
(11, 'YG', 'yashng23648@gmail.com', '1234', '7776965420', 'kedgaon', 'user'),
(12, 'mayur', 'mayur23648@gmail.com', '1234', '1234567895', 'Shriram colony Kedgaon, near nisha palace hotel', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
