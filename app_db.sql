-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2025 at 08:07 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `app_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) DEFAULT 'admin',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `role`, `created_at`) VALUES
(1, 'admin', 'admin123', 'Super Admin', '2025-10-03 14:20:36'),
(2, 'manager', 'manager123', 'Manager', '2025-10-03 14:20:36'),
(3, 'staff', 'staff123', 'Staff', '2025-10-03 14:20:36');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `product_id`, `created_at`) VALUES
(3, 1, 10, '2025-10-03 22:40:39'),
(7, 3, 3, '2025-10-03 22:40:39'),
(9, 3, 20, '2025-10-03 22:40:39'),
(13, 1, 20, '2025-10-04 02:55:01');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `sku` varchar(100) DEFAULT NULL,
  `price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `category` varchar(100) DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  `supplier` varchar(150) DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `hours` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `store_id`, `name`, `sku`, `price`, `category`, `stock`, `supplier`, `latitude`, `longitude`, `address`, `hours`, `created_at`) VALUES
(3, 3, 'Bioflu 10mg Capsule', 'MED002', 8.00, 'Medicine', 20, 'Unilab', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:40:39'),
(4, 4, 'Bioflu 10mg Capsule', 'MED003', 9.00, 'Medicine', 30, 'Unilab', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:40:39'),
(9, 3, 'Solmux 500mg', 'MED008', 12.00, 'Medicine', 20, 'Unilab', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:40:39'),
(10, 4, 'Medicol Advance', 'MED009', 9.50, 'Medicine', 25, 'Medicol', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:40:39'),
(13, 3, 'Coca-Cola 1L', 'BEV002', 54.00, 'Beverages', 25, 'Coca-Cola Philippines', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:40:39'),
(14, 4, 'Pepsi 1L', 'BEV003', 52.00, 'Beverages', 30, 'Pepsi Philippines', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:40:39'),
(17, 3, 'Zesto Mango 240ml', 'BEV006', 18.00, 'Beverages', 30, 'Zesto', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:40:39'),
(18, 4, 'Coco Mama Buko Juice', 'BEV007', 25.00, 'Beverages', 20, 'Coco Mama', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:40:39'),
(20, 3, 'Kopiko Brown 3-in-1', 'BEV009', 7.50, 'Beverages', 45, 'Kopiko', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:40:39'),
(21, 4, 'Great Taste White 3-in-1', 'BEV010', 8.50, 'Beverages', 40, 'Great Taste', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:40:39'),
(24, 3, 'Alaska Evaporada 370ml', 'BEV013', 35.00, 'Beverages', 20, 'Alaska', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:40:39'),
(26, 3, 'Piattos Cheese 80g', 'SNACK002', 28.00, 'Snacks', 35, 'Jack n Jill', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:40:39'),
(27, 4, 'Chippy BBQ 55g', 'SNACK003', 12.00, 'Snacks', 60, 'Jack n Jill', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:40:39'),
(30, 3, 'Skyflakes Crackers 25g', 'SNACK006', 6.50, 'Snacks', 70, 'Skyflakes', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:40:39'),
(31, 4, 'Fita Crackers 32g', 'SNACK007', 8.00, 'Snacks', 50, 'Fita', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:40:39'),
(34, 3, 'Hany Milk Candy', 'SNACK010', 2.00, 'Snacks', 80, 'Hany', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:40:39'),
(35, 4, 'Frutos Candy', 'SNACK011', 1.50, 'Snacks', 90, 'Frutos', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:40:39'),
(37, 3, 'Purefoods Corned Beef 150g', 'FOOD002', 52.00, 'Food', 20, 'Purefoods', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:40:39'),
(38, 4, '555 Sardines T.S. 155g', 'FOOD003', 25.00, 'Food', 35, '555', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:40:39'),
(41, 3, 'Lucky Me Instant Mami Chicken', 'FOOD006', 14.00, 'Food', 55, 'Lucky Me', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:40:39'),
(42, 4, 'Payless Pancit Canton Xtra Big', 'FOOD007', 18.00, 'Food', 40, 'Payless', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:40:39'),
(45, 3, 'Sinandomeng Rice 1kg', 'FOOD010', 53.00, 'Food', 25, 'Local Supplier', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:40:39'),
(47, 3, 'Datu Puti Vinegar 100ml', 'FOOD012', 10.00, 'Food', 40, 'Datu Puti', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:40:39'),
(48, 4, 'Silver Swan Soy Sauce 100ml', 'FOOD013', 11.00, 'Food', 35, 'Silver Swan', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:40:39'),
(51, 3, 'Palmolive Shampoo 15ml sachet', 'CARE002', 5.00, 'Personal Care', 60, 'Palmolive', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:40:39'),
(52, 4, 'Creamsilk Conditioner 15ml', 'CARE003', 6.00, 'Personal Care', 50, 'Creamsilk', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:40:39'),
(55, 3, 'Whisper Regular with Wings', 'CARE006', 15.00, 'Personal Care', 35, 'Whisper', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:40:39'),
(57, 3, 'Surf Powder 40g sachet', 'HOUSE002', 5.50, 'Household', 45, 'Surf', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:40:39'),
(58, 4, 'Zonrox Bleach 100ml', 'HOUSE003', 18.00, 'Household', 30, 'Zonrox', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:40:39'),
(61, 3, 'Fortune Red Stick', 'TOBAC002', 12.00, 'Tobacco', 30, 'Fortune', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:40:39'),
(62, 4, 'San Miguel Beer Pale Pilsen', 'ALCO001', 55.00, 'Alcohol', 20, 'San Miguel', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:40:39'),
(65, 3, 'Ballpen (Black)', 'SCHOOL002', 12.00, 'School Supplies', 35, 'Panda', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:40:39'),
(66, 4, 'Notebook 80 pages', 'SCHOOL003', 25.00, 'School Supplies', 25, 'Shopwise', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:40:39'),
(68, 3, 'Globe Load P10', 'LOAD002', 10.00, 'Mobile Load', 999, 'Globe', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:40:39'),
(69, 4, 'TM Load P10', 'LOAD003', 10.00, 'Mobile Load', 999, 'TM', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:40:39'),
(72, 3, 'Bioflu Nighttime 10mg', 'MED102', 9.50, 'Medicine', 18, 'Unilab', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:47:28'),
(73, 4, 'Bioflu Forte 15mg', 'MED103', 12.00, 'Medicine', 15, 'Unilab', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:47:28'),
(75, 3, 'Mefenamic Acid 500mg Capsule', 'MED105', 7.50, 'Medicine', 25, 'RiteMed', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:47:28'),
(76, 4, 'Dolfenal 500mg (Mefenamic)', 'MED106', 8.00, 'Medicine', 20, 'Dolfenal', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:47:28'),
(78, 3, 'Tempra 500mg', 'MED108', 6.00, 'Medicine', 35, 'Tempra', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:47:28'),
(79, 4, 'Calpol 500mg', 'MED109', 5.50, 'Medicine', 30, 'Calpol', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:47:28'),
(81, 3, 'Solmux Advance 500mg', 'MED111', 15.00, 'Medicine', 20, 'Unilab', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:47:28'),
(82, 4, 'Ascof Forte', 'MED112', 10.00, 'Medicine', 22, 'Ascof', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:47:28'),
(85, 3, 'Neozep Non-Drowsy', 'MED115', 8.50, 'Medicine', 18, 'Unilab', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:47:28'),
(87, 3, 'Tums Antacid', 'MED117', 5.00, 'Medicine', 25, 'Tums', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:47:28'),
(89, 3, 'Coca-Cola Zero 1L', 'BEV102', 56.00, 'Beverages', 18, 'Coca-Cola Philippines', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:47:28'),
(90, 4, 'Coca-Cola Light 1L', 'BEV103', 57.00, 'Beverages', 15, 'Coca-Cola Philippines', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:47:28'),
(92, 3, 'Pepsi Max 1L', 'BEV105', 54.00, 'Beverages', 16, 'Pepsi Philippines', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:47:28'),
(94, 3, 'Royal Tru-Orange 1L', 'BEV107', 55.00, 'Beverages', 20, 'Coca-Cola Philippines', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:47:28'),
(96, 3, '7Up 325ml', 'BEV109', 18.00, 'Beverages', 24, '7Up Philippines', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:47:28'),
(99, 3, 'Zesto Pineapple 240ml', 'BEV112', 18.00, 'Beverages', 23, 'Zesto', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:47:28'),
(100, 4, 'Refresh Orange 240ml', 'BEV113', 16.00, 'Beverages', 30, 'Refresh', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:47:28'),
(103, 3, 'Nescafe Creamy White', 'BEV116', 8.50, 'Beverages', 40, 'Nestle', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:47:28'),
(104, 4, 'Kopiko Black 3-in-1', 'BEV117', 8.00, 'Beverages', 38, 'Kopiko', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:47:28'),
(108, 3, 'Bear Brand Sterilized', 'BEV121', 26.00, 'Beverages', 20, 'Nestle', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:47:28'),
(109, 4, 'Alaska Condensada 300ml', 'BEV122', 42.00, 'Beverages', 18, 'Alaska', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:47:28'),
(112, 3, 'Nova Multigrain Salt n Vinegar', 'SNACK102', 26.00, 'Snacks', 32, 'Nova', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:47:28'),
(114, 3, 'Piattos Sour Cream 80g', 'SNACK104', 29.00, 'Snacks', 28, 'Jack n Jill', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:47:28'),
(116, 3, 'Chippy Chili Cheese 55g', 'SNACK106', 12.00, 'Snacks', 40, 'Jack n Jill', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:47:28'),
(118, 3, 'V-Cut Chili Cheese', 'SNACK108', 15.00, 'Snacks', 35, 'Jack n Jill', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:47:28'),
(120, 3, 'Oishi Prawn Crackers 60g', 'SNACK110', 14.00, 'Snacks', 30, 'Oishi', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:47:28'),
(122, 3, 'Rebisco Strawberry Sandwich', 'SNACK112', 10.00, 'Snacks', 42, 'Rebisco', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:47:28'),
(123, 4, 'Skyflakes Condensada 25g', 'SNACK113', 7.00, 'Snacks', 50, 'Skyflakes', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:47:28'),
(127, 3, 'Hany Coffee Candy', 'SNACK117', 2.50, 'Snacks', 65, 'Hany', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:47:28'),
(128, 4, 'Frutos Mango Candy', 'SNACK118', 1.50, 'Snacks', 70, 'Frutos', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:47:28'),
(131, 3, 'Purefoods Corned Beef 260g', 'FOOD102', 85.00, 'Food', 15, 'Purefoods', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:47:28'),
(132, 4, '555 Sardines Hot & Spicy', 'FOOD103', 27.00, 'Food', 25, '555', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:47:28'),
(136, 3, 'Lucky Me Pancit Canton Kalamansi', 'FOOD107', 15.00, 'Food', 42, 'Lucky Me', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:47:28'),
(137, 4, 'Lucky Me Beef Mami', 'FOOD108', 14.00, 'Food', 48, 'Lucky Me', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:47:28'),
(141, 3, 'Dinorado Rice 1kg', 'FOOD112', 75.00, 'Food', 18, 'Local Supplier', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:47:28'),
(143, 3, 'Datu Puti Vinegar 200ml', 'FOOD114', 18.00, 'Food', 28, 'Datu Puti', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:47:28'),
(144, 4, 'Silver Swan Soy Sauce 200ml', 'FOOD115', 19.00, 'Food', 25, 'Silver Swan', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:47:28'),
(148, 3, 'Safeguard Floral Pink 135g', 'CARE102', 36.00, 'Personal Care', 22, 'Safeguard', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:47:28'),
(149, 4, 'Dove Cream Beauty Bar 135g', 'CARE103', 48.00, 'Personal Care', 18, 'Dove', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:47:28'),
(152, 3, 'Creamsilk Damage Control 15ml', 'CARE106', 6.00, 'Personal Care', 45, 'Creamsilk', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:47:28'),
(153, 4, 'Rejoice Perfume 15ml', 'CARE107', 5.50, 'Personal Care', 40, 'Rejoice', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:47:28'),
(155, 3, 'Colgate Total 25g', 'CARE109', 20.00, 'Personal Care', 20, 'Colgate', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:47:28'),
(156, 4, 'Hapee Toothpaste 25g', 'CARE110', 15.00, 'Personal Care', 25, 'Hapee', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:47:28'),
(158, 3, 'Whisper Cottony Soft', 'CARE112', 16.00, 'Personal Care', 25, 'Whisper', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:47:28'),
(160, 3, 'Surf Powder 80g', 'HOUSE102', 9.00, 'Household', 32, 'Surf', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:47:28'),
(161, 4, 'Breeze Powder 40g', 'HOUSE103', 6.50, 'Household', 40, 'Breeze', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:47:28'),
(163, 3, 'Clorox Clean-Up 500ml', 'HOUSE105', 52.00, 'Household', 12, 'Clorox', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:47:28'),
(165, 3, 'Downy Passion 20ml', 'HOUSE107', 5.00, 'Household', 42, 'Downy', 7.8310000, 123.4340000, '456 Mabini Street, Barangay Balangasan', '5:30 AM - 9:30 PM', '2025-10-03 22:47:28'),
(166, 4, 'Surf Fabric Conditioner 20ml', 'HOUSE108', 4.50, 'Household', 38, 'Surf', 7.8270000, 123.4380000, '789 Bonifacio Street, Barangay Santiago', '6:00 AM - 10:00 PM', '2025-10-03 22:47:28'),
(174, 55, 'Kopiko Blanca Coffee 25g', 'KOP-BLANCA-25', 8.50, 'Beverages', 45, 'Kopiko', NULL, NULL, NULL, NULL, '2025-11-08 01:21:51'),
(175, 55, 'Bear Brand Powdered Milk 300g', 'BEAR-MILK-300', 28.75, 'Food', 25, 'Nestle', NULL, NULL, NULL, NULL, '2025-11-08 01:21:51'),
(176, 55, 'Zonrox Bleach 500ml', 'ZONROX-500', 25.00, 'Household', 35, 'Zonrox', NULL, NULL, NULL, NULL, '2025-11-08 01:21:51'),
(177, 55, 'Downy Fabric Conditioner 40ml', 'DOWNY-40', 6.50, 'Household', 60, 'Downy', NULL, NULL, NULL, NULL, '2025-11-08 01:21:51'),
(178, 55, 'Coke Regular 1L', 'COKE-1L', 50.00, 'Beverages', 30, 'Coca-Cola', NULL, NULL, NULL, NULL, '2025-11-08 01:21:51'),
(179, 56, 'Kopiko Brown Coffee 25g', 'KOP-BROWN-25', 8.25, 'Beverages', 40, 'Kopiko', NULL, NULL, NULL, NULL, '2025-11-08 01:21:51'),
(180, 56, 'Alaska Powdered Milk 300g', 'ALASKA-300', 26.50, 'Food', 30, 'Alaska', NULL, NULL, NULL, NULL, '2025-11-08 01:21:51'),
(181, 56, 'Clorox Bleach 500ml', 'CLOROX-500', 24.75, 'Household', 25, 'Clorox', NULL, NULL, NULL, NULL, '2025-11-08 01:21:51'),
(182, 56, 'Surf Powder 60g', 'SURF-60', 7.25, 'Household', 50, 'Surf', NULL, NULL, NULL, NULL, '2025-11-08 01:21:51'),
(183, 56, 'Pepsi 1L', 'PEPSI-1L', 48.50, 'Beverages', 35, 'PepsiCo', NULL, NULL, NULL, NULL, '2025-11-08 01:21:51'),
(184, 57, 'Nescafe Classic 25g', 'NESCAFE-25', 9.00, 'Beverages', 35, 'Nestle', NULL, NULL, NULL, NULL, '2025-11-08 01:21:51'),
(185, 57, 'Birch Tree Powdered Milk 300g', 'BIRCH-300', 27.25, 'Food', 20, 'Birch Tree', NULL, NULL, NULL, NULL, '2025-11-08 01:21:51'),
(186, 57, 'Purex Bleach 500ml', 'PUREX-500', 23.50, 'Household', 30, 'Purex', NULL, NULL, NULL, NULL, '2025-11-08 01:21:51'),
(187, 57, 'Ariel Powder 70g', 'ARIEL-70', 8.75, 'Household', 45, 'Ariel', NULL, NULL, NULL, NULL, '2025-11-08 01:21:51'),
(188, 57, 'Royal 1L', 'ROYAL-1L', 45.00, 'Beverages', 25, 'Royal', NULL, NULL, NULL, NULL, '2025-11-08 01:21:51');

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `hours` varchar(100) DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `revenue` decimal(14,2) DEFAULT 0.00,
  `customers` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `name`, `password`, `address`, `location`, `hours`, `latitude`, `longitude`, `revenue`, `customers`, `created_at`) VALUES
(3, 'Mang Juan Store', 'store123', '456 Mabini Street, Barangay Balangasan', 'Barangay Balangasan, Pagadian City', '5:30 AM - 9:30 PM', 7.8233000, 123.4283000, 12000.00, 65, '2025-10-03 22:40:38'),
(4, 'Tindahan ni Aling Maria', 'store1234', '789 Bonifacio Street, Barangay Santiago', 'Barangay Santiago, Pagadian City', '6:00 AM - 10:00 PM', 7.8218000, 123.4393000, 18000.00, 95, '2025-10-03 22:40:38'),
(52, 'Golden Sunrise Sari-Sari', 'store123', '123 Rizal Street, Barangay San Francisco', 'San Francisco, Pagadian City', '6:00 AM - 10:00 PM', 7.8308000, 123.4350000, 18500.00, 95, '2025-11-08 01:18:43'),
(53, 'Mighty Mart Labangan', 'store123', '456 National Highway, Poblacion', 'Labangan, Zamboanga del Sur', '5:30 AM - 9:30 PM', 7.8654000, 123.5120000, 22400.00, 120, '2025-11-08 01:18:43'),
(54, 'Community Choice Tukuran', 'store123', '789 Municipal Road, Town Proper', 'Tukuran, Zamboanga del Sur', '6:00 AM - 10:00 PM', 7.8523000, 123.5560000, 16700.00, 85, '2025-11-08 01:18:43'),
(55, 'Golden Sunrise Sari-Sari', 'store123', '123 Rizal Street, Barangay San Francisco', 'San Francisco, Pagadian City', '6:00 AM - 10:00 PM', 7.8308000, 123.4350000, 18500.00, 95, '2025-11-08 01:21:51'),
(56, 'Mighty Mart Labangan', 'store123', '456 National Highway, Poblacion', 'Labangan, Zamboanga del Sur', '5:30 AM - 9:30 PM', 7.8654000, 123.5120000, 22400.00, 120, '2025-11-08 01:21:51'),
(57, 'Community Choice Tukuran', 'store123', '789 Municipal Road, Town Proper', 'Tukuran, Zamboanga del Sur', '6:00 AM - 10:00 PM', 7.8523000, 123.5560000, 16700.00, 85, '2025-11-08 01:21:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`) VALUES
(1, 'Juan', 'juan@email.com', 'user123', '2025-10-03 14:20:36'),
(2, 'Maria', 'maria@email.com', 'user123', '2025-10-03 14:20:36'),
(3, 'Pedro Reyes', 'pedro@email.com', 'user123', '2025-10-03 22:40:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`product_id`),
  ADD KEY `fk_favorites_product` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_products_store` (`store_id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lat_lng` (`latitude`,`longitude`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_favorites_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_store` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
