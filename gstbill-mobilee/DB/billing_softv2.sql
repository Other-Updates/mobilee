-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 24, 2017 at 10:10 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `billing_softv2`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL,
  `admin_image` varchar(30) NOT NULL,
  `df` int(1) NOT NULL DEFAULT '0',
  `created_date` date NOT NULL,
  `last_entry` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `admin_image`, `df`, `created_date`, `last_entry`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin_icon.png', 0, '2014-11-13', '2016-12-21 10:41:53');

-- --------------------------------------------------------

--
-- Table structure for table `agent`
--

CREATE TABLE `agent` (
  `id` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(120) NOT NULL,
  `password` varchar(120) NOT NULL,
  `admin_image` varchar(130) NOT NULL,
  `address1` varchar(250) NOT NULL,
  `address2` varchar(250) NOT NULL,
  `city` varchar(70) NOT NULL,
  `pincode` varchar(7) NOT NULL,
  `mobil_number` varchar(13) NOT NULL,
  `email_id` varchar(100) NOT NULL,
  `bank_name` varchar(100) NOT NULL,
  `bank_branch` varchar(100) NOT NULL,
  `account_num` varchar(50) NOT NULL,
  `ifsc` varchar(30) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agent`
--

INSERT INTO `agent` (`id`, `role`, `name`, `username`, `password`, `admin_image`, `address1`, `address2`, `city`, `pincode`, `mobil_number`, `email_id`, `bank_name`, `bank_branch`, `account_num`, `ifsc`, `status`, `created_date`) VALUES
(1, 4, 'JOHN', 'mura', '81dc9bdb52d04dc20036dbd8313ed055', 'Tulips11.jpg', 'TEST', 'TEST', 'CHENNAI', '434434', '325356', 'john@gmail.com', 'LVB', 'T - NAGAR', '432353265', 'LVB0091', 1, '2017-08-22 08:28:55'),
(2, 4, 'Chandan Roy', 'roy', 'd4c285227493531d0577140a1ed03964', '', '12 AshokNagar', 'Dist-(North)\r\nWest Bengal', 'Kolkatta', '743222', '0800112365', 'co@gmail.com', 'Axis Bank', 'Coimbatore', '09004356546456', 'Utib0000090', 1, '2017-01-11 07:20:52'),
(3, 4, 'TINA', 'aaa', '47bce5c74f589f4867dbd57e9ca9f808', '', 'TEST', 'TEST', 'CBE', '434434', '325356', 'tina@gmail.com', 'IOB', 'COLONY', '432353265', 'NMN6466', 1, '2017-08-22 08:31:27'),
(4, 4, 'NABI', 'agent', 'b33aed8f3134996703dc39f9a7c95783', '', 'TEST', 'TSET', 'CHENNAI', '343522', '5432564343', 'nabi@gmail.com', '3423536', 'sfsdfg', '232145', 'OP93494', 1, '2017-08-22 08:33:38');

-- --------------------------------------------------------

--
-- Table structure for table `company_details`
--

CREATE TABLE `company_details` (
  `id` int(11) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `phone_no` varchar(12) NOT NULL,
  `address1` varchar(100) NOT NULL,
  `address2` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `bank_name` varchar(50) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `ifsc` varchar(20) NOT NULL,
  `ac_no` varchar(50) NOT NULL,
  `pin` varchar(8) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tin_no` int(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_details`
--

INSERT INTO `company_details` (`id`, `company_name`, `phone_no`, `address1`, `address2`, `city`, `state`, `bank_name`, `branch`, `ifsc`, `ac_no`, `pin`, `email`, `tin_no`) VALUES
(1, '  Incredible solutions', '122456646', 'No 5 & 12, Ground Floor,Chunchagatta Main Road,', 'Arunachalam street', 'Coimbatore', 'Tamil Nadu', 'INDIAN BANK', 'MADIWALA', '56235', '23123213', '1232', 'info@f2fsolutions.in', 66666);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `state_id` int(5) NOT NULL,
  `name` varchar(60) NOT NULL,
  `store_name` varchar(60) NOT NULL,
  `address1` varchar(100) NOT NULL,
  `address2` varchar(100) NOT NULL,
  `city` varchar(255) NOT NULL,
  `mobil_number` varchar(13) NOT NULL,
  `email_id` varchar(60) NOT NULL,
  `bank_name` varchar(200) NOT NULL,
  `bank_branch` varchar(50) NOT NULL,
  `account_num` varchar(40) NOT NULL,
  `ifsc` varchar(20) NOT NULL,
  `agent_name` int(11) NOT NULL,
  `payment_terms` varchar(120) NOT NULL,
  `tin` varchar(30) NOT NULL,
  `idf` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `df` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1',
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `state_id`, `name`, `store_name`, `address1`, `address2`, `city`, `mobil_number`, `email_id`, `bank_name`, `bank_branch`, `account_num`, `ifsc`, `agent_name`, `payment_terms`, `tin`, `idf`, `df`, `status`, `created_date`) VALUES
(1, 8, 'TOM', 'INFO', '123,NEW STREET ', 'TEST', 'CHENNAI', '41236', 'tom6@gmail.com', 'LVB', 'Info', '74133681', 'LVB008', 1, 'cash', '546', '2017-08-22 08:26:10', 0, 1, '0000-00-00 00:00:00'),
(2, 3, 'NANTH', 'VIWE SOLI', '2/13, TEST', 'TEST', 'CHENNAI', '23214425', 'nanth@gmail.com', 'HDFC', 'COLONY', '741369552', 'HDC009', 2, 'cash', '232', '2017-08-22 08:25:09', 0, 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `erp_brand`
--

CREATE TABLE `erp_brand` (
  `id` int(11) NOT NULL,
  `brands` varchar(30) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `erp_brand`
--

INSERT INTO `erp_brand` (`id`, `brands`, `status`, `created_date`) VALUES
(1, 'CROMPTON', 1, '0000-00-00 00:00:00'),
(2, ' HAVELLS', 1, '0000-00-00 00:00:00'),
(3, 'INCEPTOS', 1, '0000-00-00 00:00:00'),
(4, 'ORIENT', 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `erp_category`
--

CREATE TABLE `erp_category` (
  `cat_id` int(11) NOT NULL,
  `categoryName` varchar(80) NOT NULL,
  `eStatus` int(11) NOT NULL DEFAULT '1',
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `erp_category`
--

INSERT INTO `erp_category` (`cat_id`, `categoryName`, `eStatus`, `createdDate`) VALUES
(1, 'CEILING FANS', 1, '2017-08-22 08:51:35'),
(2, 'TABLE FANS', 1, '2017-08-22 08:51:15'),
(3, 'WALL FANS', 1, '2017-08-22 08:51:59'),
(4, 'EXHAUST FANS', 1, '2017-08-22 09:39:26');

-- --------------------------------------------------------

--
-- Table structure for table `erp_category_sub_category`
--

CREATE TABLE `erp_category_sub_category` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `actionId` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `erp_company_amount`
--

CREATE TABLE `erp_company_amount` (
  `id` int(11) NOT NULL,
  `receiver_type` varchar(255) NOT NULL,
  `receipt_id` varchar(120) NOT NULL,
  `recevier_id` int(120) NOT NULL,
  `recevier` enum('company','agent') NOT NULL,
  `bill_amount` float NOT NULL,
  `type` enum('credit','debit') NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `erp_company_amount`
--

INSERT INTO `erp_company_amount` (`id`, `receiver_type`, `receipt_id`, `recevier_id`, `recevier`, `bill_amount`, `type`, `created_date`) VALUES
(1, 'Purchase Cost', '2', 0, 'company', 8000, 'debit', '0000-00-00 00:00:00'),
(2, 'Project Cost', 'JOB0001 ', 1, 'agent', 50, 'debit', '2017-08-22 10:06:20'),
(3, 'Sales Reciver', 'RECQ0001', 0, 'company', 4050, 'credit', '0000-00-00 00:00:00'),
(4, 'Sales Reciver', 'RECQ0002', 0, 'company', 10000, 'credit', '0000-00-00 00:00:00'),
(5, 'Purchase Cost', '2', 0, 'company', 10300, 'debit', '0000-00-00 00:00:00'),
(6, 'Project Cost', 'JOB0002 ', 1, 'agent', 0, 'debit', '2017-08-22 10:22:48'),
(7, 'Sales Reciver', 'RECQ0003', 0, 'company', 1000, 'credit', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `erp_email_settings`
--

CREATE TABLE `erp_email_settings` (
  `id` int(11) NOT NULL,
  `type` varchar(122) NOT NULL,
  `label` varchar(122) NOT NULL,
  `value` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `erp_email_settings`
--

INSERT INTO `erp_email_settings` (`id`, `type`, `label`, `value`) VALUES
(1, 'q_sender', 'Quotation Sender Name ', 'test'),
(2, 'q_email', 'Quotation Email Id', 'bhuvana@brightuitechnologies.com'),
(3, 'q_subject', 'Quotation Default-Subject', 'quotation'),
(4, 'q_cc_email', 'Quotation Cc-Email Ids', 'test@gmail.com'),
(5, 'inv_sender', 'Invoice Sender Name ', 'test1'),
(6, 'inv_email', 'Invoice Sender email Id', 'priyabui2016@gmail.com'),
(7, 'inv_subject', 'Invoice Default-Subject', 'invoice'),
(8, 'inv_cc_email', 'Invoice Cc-Email Id', 'bhuvana@brightuitechnologies.com'),
(9, 'company_amount', 'Company Amount', '7750');

-- --------------------------------------------------------

--
-- Table structure for table `erp_enquiry`
--

CREATE TABLE `erp_enquiry` (
  `id` int(11) NOT NULL,
  `enquiry_no` varchar(11) NOT NULL,
  `customer_name` varchar(70) NOT NULL,
  `customer_address` varchar(250) NOT NULL,
  `customer_email` varchar(70) NOT NULL,
  `contact_number` varchar(120) NOT NULL,
  `enquiry_about` varchar(250) NOT NULL,
  `remarks` varchar(250) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `followup_date` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `status` enum('Pending','Completed','Reject') NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `erp_enquiry`
--

INSERT INTO `erp_enquiry` (`id`, `enquiry_no`, `customer_name`, `customer_address`, `customer_email`, `contact_number`, `enquiry_about`, `remarks`, `created_date`, `followup_date`, `created_by`, `status`) VALUES
(1, 'ERQ0001', 'PETER', 'TEST', 'peter@gamil.com', '9632587410', 'QUOTATION', 'TEST', '2017-08-22 09:49:57', '2017-08-16', 1, 'Pending'),
(2, 'ERQ0002', 'DESK TOMY', 'TEST', 'tom@gmail.com', '9632587410', 'PRODUCTS ', 'NO', '2017-08-22 10:18:58', '2017-08-10', 1, 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `erp_invoice`
--

CREATE TABLE `erp_invoice` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(125) NOT NULL,
  `q_id` varchar(11) NOT NULL,
  `customer` int(11) NOT NULL,
  `total_qty` int(11) NOT NULL,
  `tax_label` varchar(120) NOT NULL,
  `tax` float NOT NULL,
  `subtotal_qty` float NOT NULL,
  `net_total` float NOT NULL,
  `remarks` varchar(120) NOT NULL,
  `customer_po` varchar(120) NOT NULL,
  `warranty_from` date NOT NULL,
  `warranty_to` date NOT NULL,
  `created_date` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `payment_status` enum('Pending','Completed') NOT NULL,
  `estatus` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `erp_invoice`
--

INSERT INTO `erp_invoice` (`id`, `inv_id`, `q_id`, `customer`, `total_qty`, `tax_label`, `tax`, `subtotal_qty`, `net_total`, `remarks`, `customer_po`, `warranty_from`, `warranty_to`, `created_date`, `created_by`, `payment_status`, `estatus`) VALUES
(1, 'INV0001', '    1    ', 1, 8, 'OTHERS', 50, 13950, 14050, 'NO REMARKS', 'QW2233', '2017-08-01', '2018-08-01', '2017-08-22', 1, 'Completed', 1),
(2, 'INV0002', '    2    ', 2, 5, 'TAX', 10, 6732, 6742, 'NO', '956565', '2017-08-01', '2018-08-01', '1970-01-01', 1, 'Pending', 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_invoice_details`
--

CREATE TABLE `erp_invoice_details` (
  `id` int(11) NOT NULL,
  `q_id` int(11) NOT NULL,
  `in_id` int(120) NOT NULL,
  `category` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_description` varchar(255) NOT NULL,
  `product_type` enum('product','service') NOT NULL,
  `brand` int(11) NOT NULL,
  `quantity` int(4) NOT NULL,
  `per_cost` float NOT NULL,
  `tax` float NOT NULL,
  `sub_total` float NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `erp_invoice_details`
--

INSERT INTO `erp_invoice_details` (`id`, `q_id`, `in_id`, `category`, `product_id`, `product_description`, `product_type`, `brand`, `quantity`, `per_cost`, `tax`, `sub_total`, `created_date`) VALUES
(1, 1, 1, 4, 5, 'Areole  CROMPTON / HIGH SPEED / 3 BLADES', 'product', 1, 5, 1500, 20, 9000, '2017-08-22 12:07:00'),
(2, 1, 1, 3, 2, 'Ciera CABIN FAN  HAVELLS / CIERA CABIN FAN / 3 BLADES', 'product', 2, 3, 1500, 10, 4950, '2017-08-22 12:07:00'),
(3, 2, 2, 1, 3, 'Fusion  HAVELLS / FUSION / 3 BLADES', 'product', 3, 2, 1500, 2, 3060, '2017-08-22 12:23:00'),
(4, 2, 2, 3, 4, 'WALL-49  ORIENT / WALL 49 / 3 BLADES', 'product', 4, 3, 1200, 2, 3672, '2017-08-22 12:23:00');

-- --------------------------------------------------------

--
-- Table structure for table `erp_notification`
--

CREATE TABLE `erp_notification` (
  `id` int(11) NOT NULL,
  `type` enum('min_qty','quotation','payment','purchase_payment') NOT NULL,
  `Message` varchar(250) NOT NULL,
  `link` varchar(100) NOT NULL,
  `notification_date` date NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `erp_notification`
--

INSERT INTO `erp_notification` (`id`, `type`, `Message`, `link`, `notification_date`, `created_date`, `status`) VALUES
(1, 'quotation', '20-Aug-2017 is Quotation review date', 'quotation/quotation_list', '2017-08-20', '2017-08-22 09:53:17', 0),
(2, 'quotation', '24-Aug-2017 is Quotation review date', 'quotation/quotation_list', '2017-08-24', '2017-08-22 09:55:54', 0),
(3, 'purchase_payment', '23-Aug-2017-We have to pay amount for Supplier', 'purchase_receipt/receipt_list', '2017-08-23', '2017-08-22 10:01:06', 0),
(4, 'quotation', '30-Aug-2017 is Quotation review date', 'quotation/quotation_list', '2017-08-30', '2017-08-22 10:02:14', 0),
(5, 'quotation', '23-Aug-2017 is Quotation review date', 'quotation/quotation_list', '2017-08-23', '2017-08-22 10:03:34', 0),
(6, 'min_qty', 'Areole is in minimum stock', 'stock/', '2017-08-22', '2017-08-22 10:07:16', 0),
(7, 'payment', '23-Aug-2017 is due date for payment', 'receipt/receipt_list', '2017-08-23', '2017-08-22 10:08:09', 0),
(8, 'payment', '24-Aug-2017 is due date for payment', 'receipt/receipt_list', '2017-08-24', '2017-08-22 10:08:50', 0),
(9, 'quotation', '30-Aug-2017 is Quotation review date', 'quotation/quotation_list', '2017-08-30', '2017-08-22 10:20:04', 0),
(10, 'purchase_payment', '22-Aug-2017-We have to pay amount for Supplier', 'purchase_receipt/receipt_list', '2017-08-22', '2017-08-22 10:22:28', 0),
(11, 'min_qty', 'Fusion is in minimum stock', 'stock/', '2017-08-22', '2017-08-22 10:23:18', 0),
(12, 'payment', '31-Aug-2017 is due date for payment', 'receipt/receipt_list', '2017-08-31', '2017-08-22 11:47:05', 0);

-- --------------------------------------------------------

--
-- Table structure for table `erp_order`
--

CREATE TABLE `erp_order` (
  `id` int(11) NOT NULL,
  `order_no` varchar(11) NOT NULL,
  `q_id` int(11) NOT NULL,
  `approved_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `erp_other_cost`
--

CREATE TABLE `erp_other_cost` (
  `id` int(11) NOT NULL,
  `j_id` varchar(120) NOT NULL,
  `item_name` varchar(120) NOT NULL,
  `amount` float NOT NULL,
  `type` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `erp_other_cost`
--

INSERT INTO `erp_other_cost` (`id`, `j_id`, `item_name`, `amount`, `type`) VALUES
(1, '1', 'TAX', 50, 'project_cost'),
(2, '1', 'TAX', 50, 'invoice');

-- --------------------------------------------------------

--
-- Table structure for table `erp_po`
--

CREATE TABLE `erp_po` (
  `id` int(11) NOT NULL,
  `po_no` varchar(11) NOT NULL,
  `supplier` int(11) NOT NULL,
  `total_qty` int(11) NOT NULL,
  `tax_label` varchar(120) NOT NULL,
  `tax` float NOT NULL,
  `subtotal_qty` float NOT NULL,
  `net_total` float NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `remarks` varchar(250) NOT NULL,
  `delivery_schedule` date NOT NULL,
  `mode_of_payment` varchar(11) NOT NULL,
  `created_date` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `payment_status` enum('Pending','Completed') NOT NULL DEFAULT 'Pending',
  `estatus` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `erp_po`
--

INSERT INTO `erp_po` (`id`, `po_no`, `supplier`, `total_qty`, `tax_label`, `tax`, `subtotal_qty`, `net_total`, `discount`, `remarks`, `delivery_schedule`, `mode_of_payment`, `created_date`, `created_by`, `payment_status`, `estatus`) VALUES
(1, 'PO0001', 2, 40, '', 0, 46000, 46000, NULL, 'TEST', '2017-08-22', 'CASH', '2017-08-23', 1, 'Pending', 1),
(2, 'PO0002', 2, 14, '', 0, 18360, 18360, NULL, '', '2017-08-22', 'CASH', '1970-01-01', 1, 'Completed', 1),
(3, 'PO0003', 1, 5, '', 0, 5100, 5100, NULL, 'NO', '2017-08-22', 'CASH', '2017-08-16', 1, 'Pending', 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_po_details`
--

CREATE TABLE `erp_po_details` (
  `id` int(11) NOT NULL,
  `po_id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_description` varchar(255) NOT NULL,
  `type` enum('product','service') NOT NULL,
  `brand` int(11) NOT NULL,
  `quantity` int(4) NOT NULL,
  `per_cost` float NOT NULL,
  `tax` float NOT NULL,
  `sub_total` float NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `erp_po_details`
--

INSERT INTO `erp_po_details` (`id`, `po_id`, `category`, `product_id`, `product_description`, `type`, `brand`, `quantity`, `per_cost`, `tax`, `sub_total`, `created_date`) VALUES
(1, 1, 1, 5, 'Areole  CROMPTON / HIGH SPEED / 3 BLADES', 'product', 1, 20, 1000, 20, 24000, '2017-08-22 11:58:00'),
(2, 1, 3, 4, 'WALL-49  ORIENT / WALL 49 / 3 BLADES', 'product', 4, 20, 1000, 10, 22000, '2017-08-22 11:58:00'),
(5, 2, 1, 3, '  Fusion  HAVELLS / FUSION / 3 BLADES', 'product', 2, 4, 2000, 2, 8160, '2017-08-22 11:59:00'),
(6, 2, 3, 2, '  Ciera CABIN FAN  HAVELLS / CIERA CABIN FAN / 3 BLADES', 'product', 2, 10, 1000, 2, 10200, '2017-08-22 11:59:00'),
(7, 3, 4, 4, 'WALL-49  ORIENT / WALL 49 / 3 BLADES', 'product', 4, 5, 1000, 2, 5100, '2017-08-22 12:21:00');

-- --------------------------------------------------------

--
-- Table structure for table `erp_pr`
--

CREATE TABLE `erp_pr` (
  `id` int(11) NOT NULL,
  `po_no` varchar(11) NOT NULL,
  `supplier` int(11) NOT NULL,
  `total_qty` int(11) NOT NULL,
  `tax_label` varchar(120) NOT NULL,
  `tax` float NOT NULL,
  `subtotal_qty` float NOT NULL,
  `net_total` float NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `remarks` varchar(250) NOT NULL,
  `delivery_schedule` date NOT NULL,
  `mode_of_payment` varchar(11) NOT NULL,
  `created_date` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `payment_status` enum('Pending','Completed') NOT NULL DEFAULT 'Pending',
  `estatus` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `erp_pr`
--

INSERT INTO `erp_pr` (`id`, `po_no`, `supplier`, `total_qty`, `tax_label`, `tax`, `subtotal_qty`, `net_total`, `discount`, `remarks`, `delivery_schedule`, `mode_of_payment`, `created_date`, `created_by`, `payment_status`, `estatus`) VALUES
(1, 'PO0001', 2, 40, '', 0, 46000, 46000, NULL, 'TEST', '2017-08-22', 'CASH', '2017-08-23', 1, 'Pending', 1),
(2, 'PO0002', 1, 15, '', 0, 20400, 20400, NULL, '', '2017-08-22', 'CASH', '2017-08-22', 1, 'Pending', 1),
(3, 'PO0002', 2, 14, '', 0, 18360, 18360, NULL, '', '2017-08-22', 'CASH', '1970-01-01', 1, 'Pending', 1),
(4, 'PO0003', 1, 5, '', 0, 5100, 5100, NULL, 'NO', '2017-08-22', 'CASH', '2017-08-16', 1, 'Pending', 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_product`
--

CREATE TABLE `erp_product` (
  `id` int(11) NOT NULL,
  `model_no` varchar(250) NOT NULL,
  `product_name` varchar(250) NOT NULL,
  `product_description` varchar(250) NOT NULL,
  `product_image` varchar(250) NOT NULL,
  `type` enum('product','service') NOT NULL,
  `min_qty` int(11) NOT NULL,
  `selling_price` int(120) NOT NULL,
  `cost_price` int(120) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `erp_product`
--

INSERT INTO `erp_product` (`id`, `model_no`, `product_name`, `product_description`, `product_image`, `type`, `min_qty`, `selling_price`, `cost_price`, `status`) VALUES
(2, 'HAVELLS', 'Ciera CABIN FAN', 'HAVELLS / CIERA CABIN FAN / 3 BLADES', 'ceira-500x515.png', 'product', 5, 1500, 1000, 1),
(3, 'HAVELLS/FUSION', 'Fusion', 'HAVELLS / FUSION / 3 BLADES', 'Bronze-Gold-500x515.png', 'product', 2, 1500, 1000, 1),
(4, ' ORIENT', 'WALL-49', 'ORIENT / WALL 49 / 3 BLADES', 'Wall-49-500x515.jpg', 'product', 15, 1200, 1000, 1),
(5, 'CROMPTON', 'Areole', 'CROMPTON / HIGH SPEED / 3 BLADES', 'FAN1.jpeg', 'product', 10, 1500, 1000, 1),
(6, 'OTHERS', 'OTHSERS', 'OTHEES', 'ad_3.png', 'service', 100, 200, 100, 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_project_cost`
--

CREATE TABLE `erp_project_cost` (
  `id` int(11) NOT NULL,
  `job_id` varchar(125) NOT NULL,
  `q_id` varchar(11) NOT NULL,
  `customer` int(11) NOT NULL,
  `total_qty` int(11) NOT NULL,
  `tax_label` varchar(120) NOT NULL,
  `tax` float NOT NULL,
  `subtotal_qty` float NOT NULL,
  `net_total` float NOT NULL,
  `remarks` varchar(120) NOT NULL,
  `created_date` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `notification_date` date NOT NULL,
  `estatus` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `erp_project_cost`
--

INSERT INTO `erp_project_cost` (`id`, `job_id`, `q_id`, `customer`, `total_qty`, `tax_label`, `tax`, `subtotal_qty`, `net_total`, `remarks`, `created_date`, `created_by`, `notification_date`, `estatus`) VALUES
(1, 'JOB0001 ', '  1  ', 1, 8, 'OTHERS', 50, 9300, 9400, 'NO REMARKS', '2017-08-22', 1, '0000-00-00', 1),
(2, 'JOB0002 ', '  2  ', 2, 5, 'TAX', 10, 7140, 7150, 'NO', '2017-08-23', 1, '0000-00-00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_project_details`
--

CREATE TABLE `erp_project_details` (
  `id` int(11) NOT NULL,
  `q_id` int(11) NOT NULL,
  `j_id` int(120) NOT NULL,
  `category` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_description` varchar(255) NOT NULL,
  `product_type` enum('product','service') NOT NULL,
  `brand` int(11) NOT NULL,
  `quantity` int(4) NOT NULL,
  `per_cost` float NOT NULL,
  `tax` float NOT NULL,
  `sub_total` float NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `erp_project_details`
--

INSERT INTO `erp_project_details` (`id`, `q_id`, `j_id`, `category`, `product_id`, `product_description`, `product_type`, `brand`, `quantity`, `per_cost`, `tax`, `sub_total`, `created_date`) VALUES
(1, 1, 1, 4, 5, 'Areole  CROMPTON / HIGH SPEED / 3 BLADES', 'product', 1, 5, 1000, 20, 6000, '2017-08-22 12:06:00'),
(2, 1, 1, 3, 2, 'Ciera CABIN FAN  HAVELLS / CIERA CABIN FAN / 3 BLADES', 'product', 2, 3, 1000, 10, 3300, '2017-08-22 12:06:00'),
(3, 2, 2, 1, 3, 'Fusion  HAVELLS / FUSION / 3 BLADES', 'product', 3, 2, 2000, 2, 4080, '2017-08-22 12:22:00'),
(4, 2, 2, 3, 4, 'WALL-49  ORIENT / WALL 49 / 3 BLADES', 'product', 4, 3, 1000, 2, 3060, '2017-08-22 12:22:00');

-- --------------------------------------------------------

--
-- Table structure for table `erp_pr_details`
--

CREATE TABLE `erp_pr_details` (
  `id` int(11) NOT NULL,
  `po_id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_description` varchar(255) NOT NULL,
  `type` enum('product','service') NOT NULL,
  `brand` int(11) NOT NULL,
  `return_quantity` int(4) NOT NULL,
  `per_cost` float NOT NULL,
  `tax` float NOT NULL,
  `sub_total` float NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `erp_pr_details`
--

INSERT INTO `erp_pr_details` (`id`, `po_id`, `category`, `product_id`, `product_description`, `type`, `brand`, `return_quantity`, `per_cost`, `tax`, `sub_total`, `created_date`) VALUES
(1, 2, 1, 3, '  Fusion  HAVELLS / FUSION / 3 BLADES', 'product', 2, 1, 2000, 2, 8160, '2017-08-22 11:59:00'),
(2, 2, 3, 2, '  Ciera CABIN FAN  HAVELLS / CIERA CABIN FAN / 3 BLADES', 'product', 2, 0, 1000, 2, 10200, '2017-08-22 11:59:00');

-- --------------------------------------------------------

--
-- Table structure for table `erp_quotation`
--

CREATE TABLE `erp_quotation` (
  `id` int(11) NOT NULL,
  `ref_name` varchar(125) NOT NULL,
  `q_no` varchar(20) NOT NULL,
  `customer` int(11) NOT NULL,
  `total_qty` int(11) NOT NULL,
  `tax_label` varchar(120) NOT NULL,
  `tax` float NOT NULL,
  `subtotal_qty` float NOT NULL,
  `net_total` float NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `remarks` varchar(250) NOT NULL,
  `delivery_schedule` date NOT NULL,
  `mode_of_payment` varchar(11) NOT NULL,
  `validity` varchar(120) NOT NULL,
  `type` enum('direct','indirect') NOT NULL,
  `created_date` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `notification_date` date NOT NULL,
  `job_id` varchar(120) NOT NULL,
  `estatus` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `erp_quotation`
--

INSERT INTO `erp_quotation` (`id`, `ref_name`, `q_no`, `customer`, `total_qty`, `tax_label`, `tax`, `subtotal_qty`, `net_total`, `discount`, `remarks`, `delivery_schedule`, `mode_of_payment`, `validity`, `type`, `created_date`, `created_by`, `notification_date`, `job_id`, `estatus`) VALUES
(1, '1', 'IS/admin/17/08-001', 1, 8, 'OTHERS', 50, 13950, 14000, NULL, 'NO REMARKS', '2017-08-24', 'CASH', '1', 'direct', '2017-08-22', 1, '2017-08-20', 'JOB0001', 2),
(2, '1', 'IS/admin/17/08-002', 2, 5, '', 0, 6732, 6732, NULL, 'NO', '2017-08-31', 'CGG', '2', 'direct', '2017-08-23', 1, '2017-08-24', 'JOB0002', 2),
(3, 'Select', 'IS//17/08-003', 1, 2, 'OTHERS', 50, 3600, 3650, NULL, '', '2017-08-30', 'CARD', '2', 'direct', '2017-08-22', 1, '2017-08-30', 'JOB0003', 0),
(4, '1', 'IS/admin/17/08-004', 1, 2, 'OTHER', 50, 3000, 3050, NULL, 'TEST', '2017-08-23', 'CASH', '1', 'direct', '2017-08-22', 1, '2017-08-23', 'JOB0004', 2),
(5, '2', 'IS/accounts/17/08-00', 2, 120, '', 0, 146880, 146880, NULL, 'TEST', '2017-08-23', 'CARD', '1', 'direct', '2017-08-15', 1, '2017-08-30', 'JOB0005', 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_quotation_details`
--

CREATE TABLE `erp_quotation_details` (
  `id` int(11) NOT NULL,
  `q_id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_description` varchar(255) NOT NULL,
  `type` enum('product','service') NOT NULL,
  `brand` int(11) NOT NULL,
  `quantity` int(4) NOT NULL,
  `per_cost` float NOT NULL,
  `tax` float NOT NULL,
  `sub_total` float NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `erp_quotation_details`
--

INSERT INTO `erp_quotation_details` (`id`, `q_id`, `category`, `product_id`, `product_description`, `type`, `brand`, `quantity`, `per_cost`, `tax`, `sub_total`, `created_date`) VALUES
(1, 1, 4, 5, 'Areole  CROMPTON / HIGH SPEED / 3 BLADES', 'product', 1, 5, 1500, 20, 9000, '2017-08-22 15:23:00'),
(2, 1, 3, 2, 'Ciera CABIN FAN  HAVELLS / CIERA CABIN FAN / 3 BLADES', 'product', 2, 3, 1500, 10, 4950, '2017-08-22 15:23:00'),
(3, 2, 3, 4, 'WALL-49  ORIENT / WALL 49 / 3 BLADES', 'product', 4, 3, 1200, 2, 3672, '2017-08-22 15:25:00'),
(4, 2, 1, 3, 'Fusion  HAVELLS / FUSION / 3 BLADES', 'product', 3, 2, 1500, 2, 3060, '2017-08-22 15:25:00'),
(5, 3, 1, 5, 'Areole  CROMPTON / HIGH SPEED / 3 BLADES', 'product', 1, 2, 1500, 20, 3600, '2017-08-22 15:32:00'),
(6, 4, 1, 5, 'Areole  CROMPTON / HIGH SPEED / 3 BLADES', 'product', 1, 2, 1500, 0, 3000, '2017-08-22 15:33:00'),
(7, 5, 4, 4, 'WALL-49  ORIENT / WALL 49 / 3 BLADES', 'product', 4, 120, 1200, 2, 146880, '2017-08-22 15:50:00');

-- --------------------------------------------------------

--
-- Table structure for table `erp_quotation_history`
--

CREATE TABLE `erp_quotation_history` (
  `id` int(11) NOT NULL,
  `org_q_id` int(11) NOT NULL,
  `ref_name` varchar(125) NOT NULL,
  `q_no` varchar(11) NOT NULL,
  `customer` int(11) NOT NULL,
  `total_qty` int(11) NOT NULL,
  `tax_label` varchar(125) NOT NULL,
  `tax` float NOT NULL,
  `subtotal_qty` float NOT NULL,
  `net_total` float NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `remarks` varchar(11) NOT NULL,
  `delivery_schedule` date NOT NULL,
  `mode_of_payment` varchar(11) NOT NULL,
  `validity` varchar(120) NOT NULL,
  `type` enum('direct','indirect') NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `notification_date` date NOT NULL,
  `job_id` varchar(120) NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `erp_quotation_history_details`
--

CREATE TABLE `erp_quotation_history_details` (
  `id` int(11) NOT NULL,
  `h_id` int(11) NOT NULL,
  `org_q_id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_description` varchar(255) NOT NULL,
  `type` enum('product','service') NOT NULL,
  `brand` int(11) NOT NULL,
  `quantity` int(4) NOT NULL,
  `per_cost` float NOT NULL,
  `tax` float NOT NULL,
  `sub_total` float NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `erp_sales_return`
--

CREATE TABLE `erp_sales_return` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(125) NOT NULL,
  `q_id` varchar(11) NOT NULL,
  `customer` int(11) NOT NULL,
  `total_qty` int(11) NOT NULL,
  `tax_label` varchar(120) NOT NULL,
  `tax` float NOT NULL,
  `subtotal_qty` float NOT NULL,
  `net_total` float NOT NULL,
  `remarks` varchar(120) NOT NULL,
  `customer_po` varchar(120) NOT NULL,
  `warranty_from` date NOT NULL,
  `warranty_to` date NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `payment_status` enum('Pending','Completed') NOT NULL,
  `estatus` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `erp_sales_return`
--

INSERT INTO `erp_sales_return` (`id`, `inv_id`, `q_id`, `customer`, `total_qty`, `tax_label`, `tax`, `subtotal_qty`, `net_total`, `remarks`, `customer_po`, `warranty_from`, `warranty_to`, `created_date`, `created_by`, `payment_status`, `estatus`) VALUES
(1, 'INV0001', '    1    ', 1, 8, 'OTHERS', 50, 13950, 14050, 'NO REMARKS', 'QW2233', '2017-08-01', '2018-08-01', '2017-08-22 00:00:00', 1, 'Pending', 1),
(2, 'INV0002', '    2    ', 2, 5, 'TAX', 10, 6732, 6742, 'NO', '956565', '2017-08-01', '2018-08-01', '1970-01-01 00:00:00', 1, 'Pending', 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_sales_return_details`
--

CREATE TABLE `erp_sales_return_details` (
  `id` int(11) NOT NULL,
  `q_id` int(11) NOT NULL,
  `in_id` int(120) NOT NULL,
  `category` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_description` varchar(255) NOT NULL,
  `product_type` enum('product','service') NOT NULL,
  `brand` int(11) NOT NULL,
  `return_quantity` int(4) NOT NULL,
  `per_cost` float NOT NULL,
  `tax` float NOT NULL,
  `sub_total` float NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `erp_stock`
--

CREATE TABLE `erp_stock` (
  `id` int(11) NOT NULL,
  `category` int(120) NOT NULL,
  `brand` int(120) NOT NULL,
  `product_id` int(120) NOT NULL,
  `quantity` int(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `erp_stock`
--

INSERT INTO `erp_stock` (`id`, `category`, `brand`, `product_id`, `quantity`) VALUES
(1, 1, 1, 5, 20),
(2, 3, 4, 4, 17),
(3, 1, 2, 3, 4),
(4, 3, 2, 2, 7),
(5, 4, 4, 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `erp_stock_history`
--

CREATE TABLE `erp_stock_history` (
  `id` int(11) NOT NULL,
  `ref_no` varchar(120) NOT NULL,
  `type` enum('in','out','return') NOT NULL,
  `category` int(120) NOT NULL,
  `brand` int(120) NOT NULL,
  `product_id` int(120) NOT NULL,
  `quantity` int(120) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `erp_stock_history`
--

INSERT INTO `erp_stock_history` (`id`, `ref_no`, `type`, `category`, `brand`, `product_id`, `quantity`, `created_date`) VALUES
(1, 'PO0001', 'in', 1, 1, 5, 20, '2017-08-22 11:58:00'),
(2, 'PO0001', 'in', 3, 4, 4, 20, '2017-08-22 11:58:00'),
(3, 'PO0002', 'in', 1, 2, 3, 5, '2017-08-22 11:59:00'),
(4, 'PO0002', 'in', 3, 2, 2, 10, '2017-08-22 11:59:00'),
(5, 'PO0002', 'return', 1, 2, 3, -1, '2017-08-22 11:59:00'),
(6, 'PO0002', 'return', 3, 2, 2, 0, '2017-08-22 11:59:00'),
(7, 'INV0001', 'out', 4, 1, 5, -5, '2017-08-22 12:07:00'),
(8, 'INV0001', 'out', 3, 2, 2, -3, '2017-08-22 12:07:00'),
(9, 'PO0003', 'in', 4, 4, 4, 5, '2017-08-22 12:21:00'),
(10, 'INV0002', 'out', 1, 3, 3, -2, '2017-08-22 12:23:00'),
(11, 'INV0002', 'out', 3, 4, 4, -3, '2017-08-22 12:23:00');

-- --------------------------------------------------------

--
-- Table structure for table `erp_sub_category`
--

CREATE TABLE `erp_sub_category` (
  `actionId` int(11) NOT NULL,
  `sub_categoryName` varchar(150) NOT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `erp_user`
--

CREATE TABLE `erp_user` (
  `id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `nick_name` varchar(125) NOT NULL,
  `username` varchar(120) NOT NULL,
  `password` varchar(120) NOT NULL,
  `admin_image` varchar(130) NOT NULL,
  `mobile_no` int(10) NOT NULL,
  `email_id` varchar(120) NOT NULL,
  `address` varchar(120) NOT NULL,
  `role` int(120) NOT NULL,
  `signature` varchar(125) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `erp_user`
--

INSERT INTO `erp_user` (`id`, `name`, `nick_name`, `username`, `password`, `admin_image`, `mobile_no`, `email_id`, `address`, `role`, `signature`, `status`) VALUES
(1, 'admin', 'admin', 'admin', '81dc9bdb52d04dc20036dbd8313ed055', 'Hydrangeas2.jpg', 797643643, 'admin@gmail.com', '753, streeet zzzonn chebnai', 1, 'download.png', 1),
(2, 'john', 'accounts', 'accounts', '81dc9bdb52d04dc20036dbd8313ed055', 'Tulips10.jpg', 2147483647, 'priya@gmail.com', '45, salem', 2, 'Tulips.jpg', 1),
(3, 'test', 'test', 'test', '098f6bcd4621d373cade4e832627b4f6', '', 79956311, 'test@gmail.com', '2.erfr street covai', 3, 'images1.jpg', 1),
(4, 'user', 'user', 'user', 'ee11cbb19052e40b07aac0ca060c23ee', '', 907645353, 'user@gmail.com', 'jadsff,3213dkff', 5, 'Tulips1.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `increment`
--

CREATE TABLE `increment` (
  `id` int(11) NOT NULL,
  `type` varchar(30) NOT NULL,
  `code` varchar(10) NOT NULL,
  `prefix` varchar(50) NOT NULL,
  `last_increment_id` varchar(10) NOT NULL DEFAULT '001'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `increment`
--

INSERT INTO `increment` (`id`, `type`, `code`, `prefix`, `last_increment_id`) VALUES
(5, 'IS', 'IS', '16/12', '067'),
(6, 'IS', 'IS', '17/01', '006'),
(7, 'IS', 'IS', '17/02', '005'),
(8, 'IS', 'IS', '17/03', '003'),
(9, 'IS', 'IS', '17/06', '001'),
(10, 'IS', 'IS', '17/07', '001'),
(11, 'IS', 'IS', '17/08', '006');

-- --------------------------------------------------------

--
-- Table structure for table `increment_table`
--

CREATE TABLE `increment_table` (
  `id` int(11) NOT NULL,
  `type` varchar(30) NOT NULL,
  `value` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `increment_table`
--

INSERT INTO `increment_table` (`id`, `type`, `value`) VALUES
(1, 'lot_code', ''),
(2, 'color_code', 'COL0004'),
(3, 'grn_code', 'GRN16170002'),
(4, 'so_code', 'SO16170001'),
(5, 'po_code', 'PO0004'),
(6, 'job_code', 'JOB0006'),
(7, 'inv_code', 'INV0003'),
(8, 'rp_code', 'RECQ0004'),
(9, 'pi_code', 'PR16170001'),
(10, 'pr_code', 'PI16170001'),
(11, 'enq_code', 'ERQ0003'),
(12, 'qno_code', 'IS//2016/123'),
(13, 'm_code', 'MOD0001');

-- --------------------------------------------------------

--
-- Table structure for table `master_category`
--

CREATE TABLE `master_category` (
  `id` int(11) NOT NULL,
  `category` varchar(30) NOT NULL,
  `idf` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(1) NOT NULL DEFAULT '1',
  `df` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `master_fit`
--

CREATE TABLE `master_fit` (
  `id` int(11) NOT NULL,
  `master_fit` varchar(30) NOT NULL,
  `idf` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `df` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1',
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `master_state`
--

CREATE TABLE `master_state` (
  `id` int(11) NOT NULL,
  `state` varchar(60) NOT NULL,
  `st` float DEFAULT NULL,
  `cst` float DEFAULT NULL,
  `vat` float DEFAULT NULL,
  `idf` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `df` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1',
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_state`
--

INSERT INTO `master_state` (`id`, `state`, `st`, `cst`, `vat`, `idf`, `df`, `status`, `created_date`) VALUES
(1, 'Andaman and Nicobar Islands', NULL, NULL, NULL, '2016-12-14 23:44:01', 0, 1, '0000-00-00 00:00:00'),
(2, 'Andhra Pradesh', NULL, NULL, NULL, '2016-12-14 23:44:46', 0, 1, '0000-00-00 00:00:00'),
(3, 'Arunachal Pradesh', NULL, NULL, NULL, '2016-12-14 23:44:46', 0, 1, '0000-00-00 00:00:00'),
(4, 'Assam', NULL, NULL, NULL, '2016-12-14 23:45:14', 0, 1, '0000-00-00 00:00:00'),
(5, 'Bihar', NULL, NULL, NULL, '2016-12-14 23:45:14', 0, 1, '0000-00-00 00:00:00'),
(6, 'Chandigarh', NULL, NULL, NULL, '2016-12-14 23:46:00', 0, 1, '0000-00-00 00:00:00'),
(7, 'Chhattisgarh', NULL, NULL, NULL, '2016-12-14 23:46:00', 0, 1, '0000-00-00 00:00:00'),
(8, 'Dadra and Nagar Haveli', NULL, NULL, NULL, '2016-12-14 23:46:51', 0, 1, '0000-00-00 00:00:00'),
(9, 'Daman and Diu', 0, NULL, NULL, '2016-12-14 23:55:24', 0, 1, '0000-00-00 00:00:00'),
(10, 'Delhi', NULL, NULL, NULL, '2016-12-14 23:48:39', 0, 1, '0000-00-00 00:00:00'),
(11, 'Goa', NULL, NULL, NULL, '2016-12-14 23:48:39', 0, 1, '0000-00-00 00:00:00'),
(12, 'Gujarat', NULL, NULL, NULL, '2016-12-14 23:49:09', 0, 1, '0000-00-00 00:00:00'),
(13, 'Haryana', NULL, NULL, NULL, '2016-12-14 23:49:09', 0, 1, '0000-00-00 00:00:00'),
(14, 'Himachal Pradesh', NULL, NULL, NULL, '2016-12-14 23:49:33', 0, 1, '0000-00-00 00:00:00'),
(15, 'Jammu and Kashmir', NULL, NULL, NULL, '2016-12-14 23:49:33', 0, 1, '0000-00-00 00:00:00'),
(16, 'Jharkhand', NULL, NULL, NULL, '2016-12-14 23:49:52', 0, 1, '0000-00-00 00:00:00'),
(17, 'Karnataka', NULL, NULL, NULL, '2016-12-14 23:49:52', 0, 1, '0000-00-00 00:00:00'),
(18, 'Kerala', NULL, NULL, NULL, '2016-12-14 23:50:29', 0, 1, '0000-00-00 00:00:00'),
(19, 'Lakshadweep ', NULL, NULL, NULL, '2016-12-14 23:50:29', 0, 1, '0000-00-00 00:00:00'),
(20, 'Madhya Pradesh', NULL, NULL, NULL, '2016-12-14 23:51:00', 0, 1, '0000-00-00 00:00:00'),
(21, 'Maharashtra', NULL, NULL, NULL, '2016-12-14 23:51:00', 0, 1, '0000-00-00 00:00:00'),
(22, 'Manipur', NULL, NULL, NULL, '2016-12-14 23:51:26', 0, 1, '0000-00-00 00:00:00'),
(23, 'Meghalaya', NULL, NULL, NULL, '2016-12-14 23:51:26', 0, 1, '0000-00-00 00:00:00'),
(24, 'Mizoram', NULL, NULL, NULL, '2016-12-14 23:51:48', 0, 1, '0000-00-00 00:00:00'),
(25, 'Nagaland', NULL, NULL, NULL, '2016-12-14 23:51:48', 0, 1, '0000-00-00 00:00:00'),
(26, 'Odisha', NULL, NULL, NULL, '2016-12-14 23:52:11', 0, 1, '0000-00-00 00:00:00'),
(27, 'Puducherry', NULL, NULL, NULL, '2016-12-14 23:52:11', 0, 1, '0000-00-00 00:00:00'),
(28, 'Punjab', NULL, NULL, NULL, '2016-12-14 23:52:32', 0, 1, '0000-00-00 00:00:00'),
(29, 'Rajasthan', NULL, NULL, NULL, '2016-12-14 23:52:32', 0, 1, '0000-00-00 00:00:00'),
(30, 'Sikkim', NULL, NULL, NULL, '2016-12-14 23:52:54', 0, 1, '0000-00-00 00:00:00'),
(31, 'Tamil Nadu', NULL, NULL, NULL, '2016-12-14 23:52:54', 0, 1, '0000-00-00 00:00:00'),
(32, 'Telangana', NULL, NULL, NULL, '2016-12-14 23:53:22', 0, 1, '0000-00-00 00:00:00'),
(33, 'Tripura', NULL, NULL, NULL, '2016-12-14 23:53:22', 0, 1, '0000-00-00 00:00:00'),
(34, 'Uttar Pradesh', NULL, NULL, NULL, '2016-12-14 23:53:51', 0, 1, '0000-00-00 00:00:00'),
(35, 'Uttarakhand', NULL, NULL, NULL, '2016-12-14 23:53:51', 0, 1, '0000-00-00 00:00:00'),
(36, 'West Bengal', NULL, NULL, NULL, '2016-12-14 23:54:10', 0, 1, '0000-00-00 00:00:00'),
(37, 'others', NULL, NULL, NULL, '2016-12-23 13:42:19', 0, 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `master_user_role`
--

CREATE TABLE `master_user_role` (
  `id` int(11) NOT NULL,
  `user_role` varchar(30) NOT NULL,
  `permission` int(4) NOT NULL,
  `idf` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(1) NOT NULL DEFAULT '1',
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_user_role`
--

INSERT INTO `master_user_role` (`id`, `user_role`, `permission`, `idf`, `status`, `created_date`) VALUES
(1, 'Admin', 1000, '2016-12-23 05:53:58', 1, '0000-00-00 00:00:00'),
(2, 'Accounts', 900, '2017-01-11 07:29:55', 1, '0000-00-00 00:00:00'),
(3, 'Project Manager', 500, '2017-01-11 07:31:28', 1, '0000-00-00 00:00:00'),
(4, 'Field Agent', 750, '2016-12-23 13:48:24', 1, '0000-00-00 00:00:00'),
(5, 'Project Partners', 50, '2017-01-11 07:31:49', 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_receipt_bill`
--

CREATE TABLE `purchase_receipt_bill` (
  `id` int(11) NOT NULL,
  `recevier` varchar(20) NOT NULL,
  `recevier_id` int(11) NOT NULL,
  `receipt_id` int(11) NOT NULL,
  `receipt_no` varchar(20) NOT NULL,
  `bill_amount` float NOT NULL,
  `discount` float NOT NULL,
  `discount_per` varchar(10) NOT NULL,
  `terms` int(1) NOT NULL,
  `ac_no` varchar(30) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `dd_no` varchar(50) NOT NULL,
  `remarks` varchar(125) NOT NULL,
  `due_date` date NOT NULL,
  `created_date` date NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_receipt_bill`
--

INSERT INTO `purchase_receipt_bill` (`id`, `recevier`, `recevier_id`, `receipt_id`, `receipt_no`, `bill_amount`, `discount`, `discount_per`, `terms`, `ac_no`, `branch`, `dd_no`, `remarks`, `due_date`, `created_date`, `status`) VALUES
(1, 'company', 0, 2, 'REC0001', 8000, 60, '0.33', 1, '', '', '', 'NO', '2017-08-23', '2017-08-22', 1),
(2, 'company', 0, 2, 'REC007', 10300, 0, '', 1, '', '', '', 'NO', '2017-08-22', '2017-08-23', 1);

-- --------------------------------------------------------

--
-- Table structure for table `receipt_bill`
--

CREATE TABLE `receipt_bill` (
  `id` int(11) NOT NULL,
  `recevier` varchar(20) NOT NULL,
  `recevier_id` int(11) NOT NULL,
  `receipt_id` int(11) NOT NULL,
  `receipt_no` varchar(20) NOT NULL,
  `bill_amount` float NOT NULL,
  `discount` float NOT NULL,
  `discount_per` varchar(10) NOT NULL,
  `terms` int(1) NOT NULL,
  `ac_no` varchar(30) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `dd_no` varchar(50) NOT NULL,
  `due_date` date NOT NULL,
  `created_date` date NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `receipt_bill`
--

INSERT INTO `receipt_bill` (`id`, `recevier`, `recevier_id`, `receipt_id`, `receipt_no`, `bill_amount`, `discount`, `discount_per`, `terms`, `ac_no`, `branch`, `dd_no`, `due_date`, `created_date`, `status`) VALUES
(1, 'company', 0, 1, 'RECQ0001', 4050, 0, '', 1, '', '', '', '2017-08-23', '2017-08-22', 1),
(2, 'company', 0, 1, 'RECQ0002', 10000, 0, '', 3, '23223332', 'HDFC', '231323', '2017-08-24', '2017-08-22', 1),
(3, '', 0, 2, 'RECQ0003', 1000, 0, '', 1, '', '', '', '2017-08-31', '2017-08-29', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `id` int(11) NOT NULL,
  `state_id` int(5) NOT NULL,
  `name` varchar(60) NOT NULL,
  `store_name` varchar(60) NOT NULL,
  `address1` varchar(100) NOT NULL,
  `address2` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `pincode` int(6) NOT NULL,
  `mobil_number` varchar(13) NOT NULL,
  `email_id` varchar(60) NOT NULL,
  `bank_name` varchar(200) NOT NULL,
  `bank_branch` varchar(50) NOT NULL,
  `account_num` varchar(40) NOT NULL,
  `ifsc` varchar(20) NOT NULL,
  `selling_percent` float NOT NULL,
  `vendor_image` varchar(255) NOT NULL,
  `payment_terms` varchar(120) NOT NULL,
  `tin` int(11) NOT NULL,
  `idf` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `df` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1',
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`id`, `state_id`, `name`, `store_name`, `address1`, `address2`, `city`, `pincode`, `mobil_number`, `email_id`, `bank_name`, `bank_branch`, `account_num`, `ifsc`, `selling_percent`, `vendor_image`, `payment_terms`, `tin`, `idf`, `df`, `status`, `created_date`) VALUES
(1, 31, 'Karthik', 'HP', '89, control street chennai.', '', 'chennai', 632147, '789456123', 'karthi@gmail.com', 'BOI', 'Echabari', '256310001', '174op', 0, '', 'cash', 2234, '2017-08-22 08:23:16', 0, 1, '0000-00-00 00:00:00'),
(2, 3, 'VIJAY', 'INFO CART', '908,HJDFHDH VCVDD', '', 'COVAI', 789556, '79651466', 'vijay@gmail.com', 'BOI', 'COLONY', '7895103522', 'SDSD', 0, '', 'CAS', 343, '2017-08-22 08:23:26', 0, 1, '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_details`
--
ALTER TABLE `company_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `erp_brand`
--
ALTER TABLE `erp_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `erp_category`
--
ALTER TABLE `erp_category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `erp_category_sub_category`
--
ALTER TABLE `erp_category_sub_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `erp_company_amount`
--
ALTER TABLE `erp_company_amount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `erp_email_settings`
--
ALTER TABLE `erp_email_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `erp_enquiry`
--
ALTER TABLE `erp_enquiry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `erp_invoice`
--
ALTER TABLE `erp_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `erp_invoice_details`
--
ALTER TABLE `erp_invoice_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `erp_notification`
--
ALTER TABLE `erp_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `erp_order`
--
ALTER TABLE `erp_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `erp_other_cost`
--
ALTER TABLE `erp_other_cost`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `erp_po`
--
ALTER TABLE `erp_po`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `erp_po_details`
--
ALTER TABLE `erp_po_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `erp_pr`
--
ALTER TABLE `erp_pr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `erp_product`
--
ALTER TABLE `erp_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `erp_project_cost`
--
ALTER TABLE `erp_project_cost`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `erp_project_details`
--
ALTER TABLE `erp_project_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `erp_pr_details`
--
ALTER TABLE `erp_pr_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `erp_quotation`
--
ALTER TABLE `erp_quotation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `erp_quotation_details`
--
ALTER TABLE `erp_quotation_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `erp_quotation_history`
--
ALTER TABLE `erp_quotation_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `erp_quotation_history_details`
--
ALTER TABLE `erp_quotation_history_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `erp_sales_return`
--
ALTER TABLE `erp_sales_return`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `erp_sales_return_details`
--
ALTER TABLE `erp_sales_return_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `erp_stock`
--
ALTER TABLE `erp_stock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `erp_stock_history`
--
ALTER TABLE `erp_stock_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `erp_sub_category`
--
ALTER TABLE `erp_sub_category`
  ADD PRIMARY KEY (`actionId`);

--
-- Indexes for table `erp_user`
--
ALTER TABLE `erp_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `increment`
--
ALTER TABLE `increment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `increment_table`
--
ALTER TABLE `increment_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_category`
--
ALTER TABLE `master_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_fit`
--
ALTER TABLE `master_fit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_state`
--
ALTER TABLE `master_state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_user_role`
--
ALTER TABLE `master_user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_receipt_bill`
--
ALTER TABLE `purchase_receipt_bill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receipt_bill`
--
ALTER TABLE `receipt_bill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `agent`
--
ALTER TABLE `agent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `company_details`
--
ALTER TABLE `company_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `erp_brand`
--
ALTER TABLE `erp_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `erp_category`
--
ALTER TABLE `erp_category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `erp_category_sub_category`
--
ALTER TABLE `erp_category_sub_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `erp_company_amount`
--
ALTER TABLE `erp_company_amount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `erp_email_settings`
--
ALTER TABLE `erp_email_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `erp_enquiry`
--
ALTER TABLE `erp_enquiry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `erp_invoice`
--
ALTER TABLE `erp_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `erp_invoice_details`
--
ALTER TABLE `erp_invoice_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `erp_notification`
--
ALTER TABLE `erp_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `erp_order`
--
ALTER TABLE `erp_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `erp_other_cost`
--
ALTER TABLE `erp_other_cost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `erp_po`
--
ALTER TABLE `erp_po`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `erp_po_details`
--
ALTER TABLE `erp_po_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `erp_pr`
--
ALTER TABLE `erp_pr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `erp_product`
--
ALTER TABLE `erp_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `erp_project_cost`
--
ALTER TABLE `erp_project_cost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `erp_project_details`
--
ALTER TABLE `erp_project_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `erp_pr_details`
--
ALTER TABLE `erp_pr_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `erp_quotation`
--
ALTER TABLE `erp_quotation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `erp_quotation_details`
--
ALTER TABLE `erp_quotation_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `erp_quotation_history`
--
ALTER TABLE `erp_quotation_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `erp_quotation_history_details`
--
ALTER TABLE `erp_quotation_history_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `erp_sales_return`
--
ALTER TABLE `erp_sales_return`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `erp_sales_return_details`
--
ALTER TABLE `erp_sales_return_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `erp_stock`
--
ALTER TABLE `erp_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `erp_stock_history`
--
ALTER TABLE `erp_stock_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `erp_sub_category`
--
ALTER TABLE `erp_sub_category`
  MODIFY `actionId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `erp_user`
--
ALTER TABLE `erp_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `increment`
--
ALTER TABLE `increment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `increment_table`
--
ALTER TABLE `increment_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `master_category`
--
ALTER TABLE `master_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `master_fit`
--
ALTER TABLE `master_fit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `master_state`
--
ALTER TABLE `master_state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `master_user_role`
--
ALTER TABLE `master_user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `purchase_receipt_bill`
--
ALTER TABLE `purchase_receipt_bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `receipt_bill`
--
ALTER TABLE `receipt_bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
