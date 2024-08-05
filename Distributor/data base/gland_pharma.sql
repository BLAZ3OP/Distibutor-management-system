-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: May 28, 2023 at 03:17 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gland_pharma`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_credentials`
--

CREATE TABLE `admin_credentials` (
  `USERNAME` varchar(50) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL,
  `DISTY_NAME` varchar(20) NOT NULL,
  `EMAIL` varchar(30) NOT NULL,
  `ADDRESS` text NOT NULL,
  `CONTACT_NUMBER` bigint(11) NOT NULL,
  `IS_LOGGED_IN` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `admin_credentials`
--

INSERT INTO `admin_credentials` (`USERNAME`, `PASSWORD`, `DISTY_NAME`, `EMAIL`, `ADDRESS`, `CONTACT_NUMBER`, `IS_LOGGED_IN`) VALUES
('admin', 'admin1234', 'gland pharma', 'glandpharma@gmail.com', 'kkiiiikkiikiiiiiiiididididiiii', 4568753467, 'true');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `CONTACT_NUMBER` varchar(10) NOT NULL,
  `ADDRESS` varchar(100) NOT NULL,
  `CUST_NAME` varchar(20) NOT NULL,
  `CUST_ADDRESS` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`ID`, `NAME`, `CONTACT_NUMBER`, `ADDRESS`, `CUST_NAME`, `CUST_ADDRESS`) VALUES
(4, 'Kiran Suthar', '1234567690', 'Andheri East', 'Anshari', 'Andheri East'),
(6, 'Aditya', '7365687269', 'Virar north', 'Xygvhj', 'Virar east'),
(11, 'Shivam Tiwari', '6862369896', 'Dadar West', 'Dr Kapoor', 'Dadar East'),
(17, 'GDL Phrma', '4573462390', 'Near Goregopal Pahad Ke Niche , Erangle,303401', 'Bgmi', 'Kraften.inc Company No 4 South Korea');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `INVOICE_ID` int(11) NOT NULL,
  `NET_TOTAL` double NOT NULL DEFAULT 0,
  `INVOICE_DATE` date NOT NULL DEFAULT current_timestamp(),
  `CUSTOMER_ID` int(11) NOT NULL,
  `TOTAL_AMOUNT` double NOT NULL,
  `TOTAL_DISCOUNT` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`INVOICE_ID`, `NET_TOTAL`, `INVOICE_DATE`, `CUSTOMER_ID`, `TOTAL_AMOUNT`, `TOTAL_DISCOUNT`) VALUES
(7, 2363.4, '2023-05-22', 6, 2626, 262.6),
(8, 135, '2023-05-22', 11, 150, 15),
(9, 23634, '2023-05-26', 4, 26260, 2626),
(10, 236340, '2023-05-27', 4, 262600, 26260);

-- --------------------------------------------------------

--
-- Table structure for table `medicines`
--

CREATE TABLE `medicines` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `PACKING` varchar(20) NOT NULL,
  `GENERIC_NAME` varchar(100) NOT NULL,
  `SUPPLIER_NAME` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `medicines`
--

INSERT INTO `medicines` (`ID`, `NAME`, `PACKING`, `GENERIC_NAME`, `SUPPLIER_NAME`) VALUES
(1, 'Nicip Plus', '10tab', 'Paracetamole', 'BDPL PHARMA'),
(2, 'Crosin', '10tab', 'Hdsgvkvajkcbja', 'Kiran Pharma'),
(4, 'Dolo 650', '15tab', 'paracetamole', 'BDPL PHARMA'),
(5, 'Gelusil', '10tab', 'mint fla', 'Desai Pharma'),
(6, 'Paracitamol', '20TAB', 'Headpain', 'Adarsh'),
(21, 'Vicks', '10TAB', 'Vicku', 'BDPL PHARMA'),
(22, 'Vicks 78', '10TAB', 'Tyi', 'Vicks');

-- --------------------------------------------------------

--
-- Table structure for table `medicines_stock`
--

CREATE TABLE `medicines_stock` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `BATCH_ID` varchar(20) NOT NULL,
  `EXPIRY_DATE` varchar(10) NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  `MRP` double NOT NULL,
  `RATE` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `medicines_stock`
--

INSERT INTO `medicines_stock` (`ID`, `NAME`, `BATCH_ID`, `EXPIRY_DATE`, `QUANTITY`, `MRP`, `RATE`) VALUES
(1, 'Crosin', 'CROS12', '12/34', 89, 2626, 26),
(2, 'Gelusil', 'G327', '12/42', 0, 15, 11),
(3, 'Dolo 650', 'DOLO327', '01/23', 300, 30, 24),
(4, 'Nicip Plus', 'NI325', '05/28', 3000, 32.65, 28),
(5, 'Afgtydt', '546557', '12/34', 3, 34, 22),
(6, 'Vicks', 'VIX1342', '12/29', 100, 90, 80);

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `SUPPLIER_NAME` varchar(100) NOT NULL,
  `INVOICE_NUMBER` int(11) NOT NULL,
  `VOUCHER_NUMBER` int(11) NOT NULL,
  `PURCHASE_DATE` varchar(10) NOT NULL,
  `TOTAL_AMOUNT` double NOT NULL,
  `PAYMENT_STATUS` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`SUPPLIER_NAME`, `INVOICE_NUMBER`, `VOUCHER_NUMBER`, `PURCHASE_DATE`, `TOTAL_AMOUNT`, `PAYMENT_STATUS`) VALUES
('Adarsh', 32, 1, '2023-05-18', 1000, 'PAID'),
('Adarsh', 56, 2, '2023-05-19', 15000, 'PAID'),
('Adarsh', 11, 3, '2023-05-21', 15000, 'PAID'),
('Kiran Pharma', 12, 4, '2023-05-21', 2500, 'PAID'),
('Avceve', 223, 5, '2023-05-21', 2820, 'PAID'),
('BDPL PHARMA', 33, 6, '2023-05-21', 184, 'PAID'),
('Dfnsfndfndf', 123, 7, '2023-05-21', 207, 'PAID'),
('Rsrnrnrndnn', 25676, 8, '2023-05-21', 1156, 'PAID'),
('Gahgkakbvkv', 45, 9, '2023-05-21', 9945, 'PAID'),
('Gahgkakbvkv', 48, 10, '2023-05-21', 9945, 'PAID'),
('Hmrxfmgtmt', 76, 11, '2023-05-21', 448, 'PAID'),
('Hmrxfmgtmt', 445, 12, '2023-05-21', 990, 'PAID'),
('BDPL PHARMA', 17, 13, '2023-05-22', 8000, 'DUE'),
('Vicks', 34, 14, '2023-05-27', 800, 'DUE');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `CUSTOMER_ID` int(10) NOT NULL,
  `INVOICE_NUMBER` int(10) NOT NULL,
  `MEDICINE_NAME` varchar(20) NOT NULL,
  `BATCH_ID` int(10) NOT NULL,
  `EXPIRY_DATE` varchar(10) NOT NULL,
  `QUANTITY` int(10) NOT NULL,
  `MRP` double NOT NULL,
  `DISCOUNT` double NOT NULL,
  `TOTAL` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`CUSTOMER_ID`, `INVOICE_NUMBER`, `MEDICINE_NAME`, `BATCH_ID`, `EXPIRY_DATE`, `QUANTITY`, `MRP`, `DISCOUNT`, `TOTAL`) VALUES
(6, 6, 'Gelusil', 0, '12/42', 12, 15, 10, 162),
(6, 7, 'Crosin', 0, '12/34', 1, 2626, 10, 2363.4),
(11, 8, 'Gelusil', 0, '12/42', 10, 15, 10, 135),
(4, 9, 'Crosin', 0, '12/34', 10, 2626, 10, 23634),
(4, 10, 'Crosin', 0, '12/34', 100, 2626, 10, 236340);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `CONTACT_NUMBER` varchar(10) NOT NULL,
  `ADDRESS` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`ID`, `NAME`, `EMAIL`, `CONTACT_NUMBER`, `ADDRESS`) VALUES
(1, 'Vicks', 'vicks@gmail.com', '7765342286', 'F-10,vicks Factory ,ganaga Nagar ,manglore -330201');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_credentials`
--
ALTER TABLE `admin_credentials`
  ADD PRIMARY KEY (`USERNAME`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`INVOICE_ID`);

--
-- Indexes for table `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `medicines_stock`
--
ALTER TABLE `medicines_stock`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `BATCH_ID` (`BATCH_ID`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`VOUCHER_NUMBER`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `INVOICE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `medicines`
--
ALTER TABLE `medicines`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `medicines_stock`
--
ALTER TABLE `medicines_stock`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `VOUCHER_NUMBER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
