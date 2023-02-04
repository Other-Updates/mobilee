-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2016 at 09:12 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory`
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
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin_icon.png', 0, '2014-11-13', '2014-11-27 14:41:10');

-- --------------------------------------------------------

--
-- Table structure for table `agent`
--

CREATE TABLE `agent` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
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

INSERT INTO `agent` (`id`, `name`, `address1`, `address2`, `city`, `pincode`, `mobil_number`, `email_id`, `bank_name`, `bank_branch`, `account_num`, `ifsc`, `status`, `created_date`) VALUES
(1, 'Muraleedharan', '2/299,Venkitvihar mani iyyer Road', 'Chathapuram,Kalpathy', 'Palakad', '678003', '9447835296', 'muraleedharanplakkat@gmail.com', 'Canara Bank', 'Kalapathi', '1166101026629', 'Cnrb0001166', 1, '2015-03-12 12:27:52'),
(2, 'Chandan Roy', '186A/1/3 AshokNagar,\nP.0.-AshokNagar', 'Dist-24Pgs(North)\nWest Bengal', 'Kolkatta', '743222', '08001800141', 'cottoncolorseast@gmail.com', 'Axis Bank', 'Coimbatore', '090010100238151', 'Utib0000090', 1, '2015-03-19 08:08:23');

-- --------------------------------------------------------

--
-- Table structure for table `buying`
--

CREATE TABLE `buying` (
  `id` int(11) NOT NULL,
  `lot_no` varchar(6) NOT NULL,
  `year` year(4) NOT NULL,
  `from_month` int(2) NOT NULL,
  `to_month` int(2) NOT NULL,
  `season_id` int(11) NOT NULL,
  `item_code` varchar(6) NOT NULL,
  `style_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `fit_id` int(11) NOT NULL,
  `mrp` float NOT NULL,
  `landed_cost` float NOT NULL,
  `avail_material` float NOT NULL,
  `consumption` float NOT NULL,
  `pieces` int(11) NOT NULL,
  `landed_value` float NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `commission`
--

CREATE TABLE `commission` (
  `id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `receipt_list` varchar(100) NOT NULL,
  `total_inv_value` varchar(10) NOT NULL,
  `total_dis_value` varchar(10) NOT NULL,
  `net_receipt_val` varchar(10) NOT NULL,
  `agent_comm` varchar(5) NOT NULL,
  `agent_comm_value` varchar(10) NOT NULL,
  `complete_status` int(1) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `commission_bill`
--

CREATE TABLE `commission_bill` (
  `id` int(11) NOT NULL,
  `comm_id` int(11) NOT NULL,
  `bill_amount` float NOT NULL,
  `discount` float NOT NULL,
  `discount_per` varchar(10) NOT NULL,
  `terms` int(1) NOT NULL,
  `ac_no` varchar(30) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `dd_no` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_details`
--

INSERT INTO `company_details` (`id`, `company_name`, `phone_no`, `address1`, `address2`, `city`, `state`, `bank_name`, `branch`, `ifsc`, `ac_no`, `pin`, `email`) VALUES
(1, 'Sneha Apparels', '080-2632 028', 'No 5 & 12, Ground Floor,Chunchagatta Main Road,', 'Yele chenahaill,', 'Bangalore', 'Karnataka', 'INDIAN BANK', 'MADIWALA', '56235', '23655863', '560062', 'mcplsaran@gmail.com');

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
  `city` varchar(50) NOT NULL,
  `pincode` int(6) NOT NULL,
  `mobil_number` varchar(13) NOT NULL,
  `email_id` varchar(60) NOT NULL,
  `bank_name` varchar(200) NOT NULL,
  `bank_branch` varchar(50) NOT NULL,
  `account_num` varchar(40) NOT NULL,
  `ifsc` varchar(20) NOT NULL,
  `selling_percent` float NOT NULL,
  `c_st` varchar(3) NOT NULL,
  `c_cst` varchar(3) NOT NULL,
  `c_vat` varchar(3) NOT NULL,
  `agent_name` int(11) NOT NULL,
  `agent_comm` varchar(3) NOT NULL,
  `payment_terms` int(11) NOT NULL,
  `tin` varchar(30) NOT NULL,
  `idf` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `df` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1',
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `state_id`, `name`, `store_name`, `address1`, `address2`, `city`, `pincode`, `mobil_number`, `email_id`, `bank_name`, `bank_branch`, `account_num`, `ifsc`, `selling_percent`, `c_st`, `c_cst`, `c_vat`, `agent_name`, `agent_comm`, `payment_terms`, `tin`, `idf`, `df`, `status`, `created_date`) VALUES
(1, 1, 'Mr.Babu John And Baby John', 'Dhanush Clothing', '33/2943, PAROPPADI', 'MERIKUNNU (PO)', 'Calicut', 673012, '8086008160', 'dhanushclothingclt@gmail.com', 'Punjab National Bank', 'Govindapuram Branch', '4274008700000134', 'Punb0427400', 45, '', '2', '', 1, '5', 45, '', '2015-03-12 12:32:07', 0, 1, '0000-00-00 00:00:00'),
(2, 2, 'Mr Abishek Ganeriwala ', 'Avni Enterprise', 'No.P-236,C.I.T Road,\n', 'Scheme-IV(M)', 'Kolkata', 700010, '9836921849', 'abhi_ganeriwala@yahoo.co.in', 'Corporation Bank', 'Maniktala', '415', 'Corp0000609', 50, '', '', '', 2, '5', 45, '', '2015-03-19 08:18:28', 0, 1, '0000-00-00 00:00:00'),
(3, 3, 'Mr Deepak Ranjan Dash', 'S.K.Traders', 'opp-RTO Office\nDist.Keonjhar', 'Keonjhar,Jaganathpur', 'Keonjhar', 758001, '7377328274', 'sktradersgarments@gmail.com', 'Xxxxx', 'Xxxxx', '1000000000', 'Xxxxx', 46.9, '', '2', '', 2, '5', 45, '', '2015-03-19 09:46:16', 0, 1, '0000-00-00 00:00:00'),
(4, 6, 'Mr.Samajit', 'Prokriti Enterprises', 'H.No.3,BapujiPath,\nItanagar,', 'Dhirenpara,Gawahati', 'Gawahati', 781025, '9707312601', 'prokriti@gmail.com', 'Xxxx', 'Xxxxx', 'Xxxxx', 'Xxxx', 44, '', '2', '', 2, '5', 45, '', '2015-03-19 09:53:45', 0, 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `id` int(11) NOT NULL,
  `expense` varchar(50) NOT NULL,
  `expense_type` enum('fixed','variable') NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `expense`
--

INSERT INTO `expense` (`id`, `expense`, `expense_type`, `status`) VALUES
(1, 'Salary', 'fixed', 1),
(2, 'Electric Bill', 'fixed', 1),
(3, 'Internet Charge', 'fixed', 1),
(4, 'Agency Commission', 'variable', 1),
(5, 'Advertisement', 'variable', 1),
(6, 'Transport', 'variable', 1),
(7, 'Test', 'fixed', 0),
(8, 'Test', 'fixed', 0),
(9, 'Test', 'fixed', 0);

-- --------------------------------------------------------

--
-- Table structure for table `expense_fixed`
--

CREATE TABLE `expense_fixed` (
  `id` int(11) NOT NULL,
  `exp_date` date NOT NULL,
  `exp_type` int(11) NOT NULL,
  `exp_value` float NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `expense_variable`
--

CREATE TABLE `expense_variable` (
  `id` int(11) NOT NULL,
  `exp_against` enum('suplier','customer','style','sale_order','transport','agent') NOT NULL,
  `exp_for` int(11) NOT NULL,
  `date` date NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `expense_variable_detaills`
--

CREATE TABLE `expense_variable_detaills` (
  `id` int(11) NOT NULL,
  `exp_var_id` int(11) NOT NULL,
  `exp_type` int(11) NOT NULL,
  `exp_amount` float NOT NULL,
  `exp_desc` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gen`
--

CREATE TABLE `gen` (
  `id` int(11) NOT NULL,
  `po_no` varchar(11) NOT NULL,
  `grn_no` varchar(15) NOT NULL,
  `inv_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `total_qty` int(11) NOT NULL,
  `total_value` float NOT NULL,
  `inv_status` int(1) DEFAULT '0',
  `df` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gen_details`
--

CREATE TABLE `gen_details` (
  `id` int(11) NOT NULL,
  `gen_id` int(11) NOT NULL,
  `style_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `lot_no` varchar(20) NOT NULL,
  `size_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(3, 'grn_code', 'GRN15160000'),
(4, 'so_code', 'SO15160000'),
(5, 'po_code', 'PO15160000'),
(6, 'ps_code', 'PS15160000'),
(7, 'inv_code', 'INV15160000'),
(8, 'rp_code', 'RP15160000'),
(9, 'pi_code', 'PR15160000'),
(10, 'pr_code', 'PI15160000');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `inv_no` varchar(20) NOT NULL,
  `package_id` int(11) NOT NULL,
  `challen_no` varchar(50) NOT NULL,
  `po_no` varchar(20) NOT NULL,
  `work_order_no` varchar(50) NOT NULL,
  `terms_of_payment` varchar(100) NOT NULL,
  `docket_no` varchar(50) NOT NULL,
  `despatch_throught` varchar(100) NOT NULL,
  `total_qty` int(11) NOT NULL,
  `org_value` float NOT NULL,
  `total_value` float NOT NULL,
  `inv_date` date NOT NULL,
  `due_date` date NOT NULL,
  `remarks` varchar(250) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `receipt_status` int(11) NOT NULL DEFAULT '0',
  `df` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item_code`
--

CREATE TABLE `item_code` (
  `id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `style_no` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `fit` varchar(50) NOT NULL,
  `fabric_type` varchar(100) NOT NULL,
  `pattern` varchar(100) NOT NULL,
  `idf` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `df` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

--
-- Dumping data for table `master_category`
--

INSERT INTO `master_category` (`id`, `category`, `idf`, `status`, `df`) VALUES
(1, 'Mens', '2015-03-12 10:33:35', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `master_colour`
--

CREATE TABLE `master_colour` (
  `id` int(11) NOT NULL,
  `colour` varchar(30) NOT NULL,
  `colour_code` varchar(15) NOT NULL,
  `idf` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `df` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1',
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_colour`
--

INSERT INTO `master_colour` (`id`, `colour`, `colour_code`, `idf`, `df`, `status`, `created_date`) VALUES
(1, 'Cream', 'COL0006', '2015-03-12 08:14:01', 0, 1, '0000-00-00 00:00:00'),
(2, 'Navy', 'COL0007', '2015-03-12 08:14:21', 0, 1, '0000-00-00 00:00:00'),
(3, 'Olive', 'COL0008', '2015-03-12 08:14:33', 0, 1, '0000-00-00 00:00:00'),
(4, 'Brown', 'COL0009', '2015-03-12 08:14:43', 0, 1, '0000-00-00 00:00:00'),
(5, 'Black', 'COL0010', '2015-03-12 08:20:00', 0, 1, '0000-00-00 00:00:00'),
(6, 'Light Grey', 'COL0011', '2015-03-12 08:20:37', 0, 1, '0000-00-00 00:00:00'),
(7, 'Khaki', 'COL0012', '2015-03-12 08:20:57', 0, 1, '0000-00-00 00:00:00'),
(8, 'Coffee', 'COL0013', '2015-03-12 08:21:34', 0, 1, '0000-00-00 00:00:00'),
(9, 'Dark Khaki', 'COL0014', '2015-03-12 08:27:41', 0, 1, '0000-00-00 00:00:00'),
(10, 'Grey', 'COL0015', '2015-03-12 08:28:49', 0, 1, '0000-00-00 00:00:00'),
(11, 'Dark Grey', 'COL0016', '2015-03-12 08:37:59', 0, 1, '0000-00-00 00:00:00'),
(12, 'Beige', 'COL0017', '2015-03-12 08:46:13', 0, 1, '0000-00-00 00:00:00'),
(13, 'Steel Grey', 'COL0018', '2015-03-12 08:46:56', 0, 1, '0000-00-00 00:00:00'),
(14, 'White', 'COL0019', '2015-03-12 08:47:42', 0, 1, '0000-00-00 00:00:00'),
(15, 'Chocolate', 'COL0019', '2015-03-12 10:12:02', 0, 0, '0000-00-00 00:00:00'),
(16, 'Stone', 'COL0020', '2015-03-12 08:49:20', 0, 1, '0000-00-00 00:00:00'),
(17, 'Clay', 'COL0021', '2015-03-12 08:49:38', 0, 1, '0000-00-00 00:00:00'),
(18, 'Light Brown', 'COL0022', '2015-03-12 08:50:19', 0, 1, '0000-00-00 00:00:00'),
(19, 'Ash', 'COL0023', '2015-03-12 08:50:43', 0, 1, '0000-00-00 00:00:00'),
(20, 'Ecru', 'COL0024', '2015-03-12 08:50:56', 0, 1, '0000-00-00 00:00:00'),
(21, 'Dark Navy', 'COL0025', '2015-03-12 08:52:13', 0, 1, '0000-00-00 00:00:00'),
(22, 'Rust', 'COL0026', '2015-03-13 04:57:11', 0, 1, '0000-00-00 00:00:00'),
(23, 'Khaki 2', 'COL0027', '2015-03-13 04:57:28', 0, 1, '0000-00-00 00:00:00'),
(24, 'Wine', 'COL0028', '2015-03-13 04:57:34', 0, 1, '0000-00-00 00:00:00'),
(25, 'Khaki 1', 'COL0029', '2015-03-13 04:58:10', 0, 1, '0000-00-00 00:00:00'),
(26, 'Chocolate', 'COL0030', '2015-03-19 10:02:09', 0, 1, '0000-00-00 00:00:00');

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

--
-- Dumping data for table `master_fit`
--

INSERT INTO `master_fit` (`id`, `master_fit`, `idf`, `df`, `status`, `created_date`) VALUES
(1, 'Narrow Fit', '2015-03-12 10:37:30', 0, 1, '0000-00-00 00:00:00'),
(2, 'Newyork Slim Fit', '2015-03-12 10:37:42', 0, 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `master_season`
--

CREATE TABLE `master_season` (
  `id` int(11) NOT NULL,
  `season` varchar(20) NOT NULL,
  `df` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `master_size`
--

CREATE TABLE `master_size` (
  `id` int(11) NOT NULL,
  `size` varchar(10) NOT NULL,
  `idf` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `df` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1',
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_size`
--

INSERT INTO `master_size` (`id`, `size`, `idf`, `df`, `status`, `created_date`) VALUES
(9, '28"', '2015-03-12 11:10:04', 0, 1, '0000-00-00 00:00:00'),
(10, '30"', '2015-03-12 11:10:10', 0, 1, '0000-00-00 00:00:00'),
(11, '32"', '2015-03-12 11:10:16', 0, 1, '0000-00-00 00:00:00'),
(12, '34"', '2015-03-12 11:10:22', 0, 1, '0000-00-00 00:00:00'),
(13, '36"', '2015-03-12 11:10:28', 0, 1, '0000-00-00 00:00:00'),
(14, '38"', '2015-03-12 11:10:34', 0, 1, '0000-00-00 00:00:00'),
(15, '40"', '2015-03-12 11:10:42', 0, 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `master_state`
--

CREATE TABLE `master_state` (
  `id` int(11) NOT NULL,
  `state` varchar(60) NOT NULL,
  `st` float NOT NULL,
  `cst` float NOT NULL,
  `vat` float NOT NULL,
  `idf` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `df` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1',
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_state`
--

INSERT INTO `master_state` (`id`, `state`, `st`, `cst`, `vat`, `idf`, `df`, `status`, `created_date`) VALUES
(1, 'Kerela', 0, 2, 0, '2015-03-12 10:18:30', 0, 1, '0000-00-00 00:00:00'),
(2, 'West Bengal', 0, 2, 0, '2015-03-12 10:18:46', 0, 1, '0000-00-00 00:00:00'),
(3, 'Odisa', 0, 2, 0, '2015-03-12 10:18:58', 0, 1, '0000-00-00 00:00:00'),
(4, 'New Delhi', 0, 2, 0, '2015-03-12 10:19:32', 0, 1, '0000-00-00 00:00:00'),
(5, 'Karanataka', 0, 0, 5.5, '2015-03-19 07:54:16', 0, 1, '0000-00-00 00:00:00'),
(6, 'Assam', 0, 2, 0, '2015-03-19 07:54:38', 0, 1, '0000-00-00 00:00:00'),
(7, 'Tamil Nadu', 0, 2, 0, '2015-03-19 07:54:56', 0, 1, '0000-00-00 00:00:00'),
(8, 'Andra Pradesh', 0, 2, 0, '2015-03-19 07:55:11', 0, 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `master_style`
--

CREATE TABLE `master_style` (
  `id` int(11) NOT NULL,
  `style_name` varchar(40) NOT NULL,
  `mrp` float(6,2) NOT NULL,
  `sp` float(6,2) NOT NULL,
  `style_type` int(11) NOT NULL,
  `style_desc` varchar(250) NOT NULL,
  `fit` int(11) NOT NULL,
  `style_image` varchar(50) NOT NULL,
  `idf` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `df` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1',
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_style`
--

INSERT INTO `master_style` (`id`, `style_name`, `mrp`, `sp`, `style_type`, `style_desc`, `fit`, `style_image`, `idf`, `df`, `status`, `created_date`) VALUES
(1, 'Twist', 1.00, 318.00, 1, '100%Cotton Twill\n', 1, 'normal_image.png', '2015-03-20 05:35:37', 0, 1, '0000-00-00 00:00:00'),
(2, 'Vibrant', 1.00, 430.00, 1, 'Cotton Y/D Lycra\n', 2, 'normal_image.png', '2015-03-20 05:35:37', 0, 1, '0000-00-00 00:00:00'),
(3, 'Slate', 1.00, 430.00, 1, 'Cotton satin\n', 1, 'normal_image.png', '2015-03-20 05:35:37', 0, 1, '0000-00-00 00:00:00'),
(4, 'Cameo', 1.00, 430.00, 1, 'Cotton Dobby Lycra\n', 2, 'normal_image.png', '2015-03-20 05:35:37', 0, 1, '0000-00-00 00:00:00'),
(5, 'Crave', 1.00, 424.09, 1, 'Dobby Lycra\n', 2, 'normal_image.png', '2015-03-20 05:35:37', 0, 1, '0000-00-00 00:00:00'),
(6, 'Pride', 1.00, 430.00, 1, 'Cotton Twill\n', 1, 'normal_image.png', '2015-03-20 05:35:37', 0, 1, '0000-00-00 00:00:00'),
(7, ' Nixon', 1.00, 424.00, 1, '100%Cotton Slub Satin\n', 1, 'normal_image.png', '2015-03-20 05:35:37', 0, 1, '0000-00-00 00:00:00'),
(8, 'Mapple Leaf', 1.00, 500.00, 1, 'Cotton Lycra Peach Garment dye \n', 2, 'normal_image.png', '2015-03-23 07:39:14', 0, 1, '0000-00-00 00:00:00'),
(9, 'Howdy', 1.00, 404.84, 1, 'Cotton Twil', 1, 'normal_image.png', '2015-03-20 05:35:37', 0, 1, '0000-00-00 00:00:00'),
(10, 'Fusion', 1.00, 386.09, 1, 'Brown Twill\n', 1, 'normal_image.png', '2015-03-20 05:35:37', 0, 1, '0000-00-00 00:00:00'),
(11, 'Rowel', 1.00, 410.34, 1, 'Satin Lycra\n', 2, 'normal_image.png', '2015-03-20 05:35:37', 0, 1, '0000-00-00 00:00:00'),
(12, 'Mareo', 1.00, 400.29, 1, 'PC Twill\n', 1, 'normal_image.png', '2015-03-20 05:35:37', 0, 1, '0000-00-00 00:00:00'),
(13, 'Twilight', 1.00, 430.69, 1, 'PC Satin\n', 1, 'normal_image.png', '2015-03-20 05:35:37', 0, 1, '0000-00-00 00:00:00'),
(14, 'Titanium', 1.00, 418.00, 1, 'Cotton Twill lycra Peach\n', 2, 'normal_image.png', '2015-03-20 05:35:37', 0, 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `master_style_color`
--

CREATE TABLE `master_style_color` (
  `id` int(11) NOT NULL,
  `style_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_style_color`
--

INSERT INTO `master_style_color` (`id`, `style_id`, `color_id`, `status`) VALUES
(1, 1, 3, 1),
(2, 1, 4, 1),
(3, 1, 7, 1),
(4, 2, 2, 1),
(5, 2, 3, 1),
(6, 2, 4, 1),
(7, 3, 1, 1),
(8, 3, 2, 1),
(9, 3, 5, 1),
(10, 3, 6, 1),
(11, 3, 7, 1),
(12, 4, 1, 1),
(13, 4, 5, 1),
(14, 4, 7, 1),
(15, 4, 8, 1),
(16, 5, 2, 1),
(17, 5, 4, 1),
(18, 5, 5, 1),
(19, 5, 9, 1),
(20, 6, 1, 1),
(21, 6, 7, 1),
(22, 6, 10, 1),
(28, 7, 1, 1),
(29, 7, 2, 1),
(30, 7, 5, 1),
(31, 7, 7, 1),
(32, 7, 10, 1),
(33, 7, 26, 1),
(47, 10, 2, 1),
(48, 10, 3, 1),
(49, 10, 4, 1),
(50, 10, 5, 1),
(51, 10, 7, 1),
(52, 10, 12, 1),
(53, 11, 2, 1),
(54, 11, 3, 1),
(55, 11, 4, 1),
(56, 11, 5, 1),
(57, 11, 6, 1),
(58, 11, 13, 1),
(59, 12, 2, 1),
(60, 12, 3, 1),
(61, 12, 5, 1),
(62, 12, 6, 1),
(63, 12, 8, 1),
(64, 12, 10, 1),
(65, 12, 12, 1),
(66, 12, 19, 1),
(67, 12, 20, 1),
(68, 13, 2, 1),
(69, 13, 3, 1),
(70, 13, 4, 1),
(71, 13, 5, 1),
(72, 13, 6, 1),
(73, 13, 11, 1),
(74, 13, 12, 1),
(75, 13, 16, 1),
(76, 13, 20, 1),
(86, 14, 1, 1),
(87, 14, 2, 1),
(88, 14, 9, 1),
(89, 14, 10, 1),
(90, 14, 12, 1),
(91, 14, 22, 1),
(92, 14, 23, 1),
(93, 14, 24, 1),
(94, 14, 25, 1),
(119, 9, 2, 1),
(120, 9, 3, 1),
(121, 9, 5, 1),
(122, 9, 7, 1),
(123, 9, 8, 1),
(124, 9, 10, 1),
(125, 9, 19, 1),
(126, 9, 20, 1),
(140, 16, 26, 1),
(141, 15, 27, 1),
(154, 8, 2, 1),
(155, 8, 3, 1),
(156, 8, 4, 1),
(157, 8, 5, 1),
(158, 8, 7, 1),
(159, 8, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `master_style_mrp`
--

CREATE TABLE `master_style_mrp` (
  `id` int(11) NOT NULL,
  `style_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `mrp` float NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_style_mrp`
--

INSERT INTO `master_style_mrp` (`id`, `style_id`, `customer_id`, `mrp`, `status`) VALUES
(1, 1, 1, 799, 0),
(2, 1, 2, 799, 0),
(3, 1, 3, 799, 0),
(4, 1, 4, 799, 0),
(5, 2, 1, 1099, 0),
(6, 2, 2, 1099, 0),
(7, 2, 3, 1099, 0),
(8, 2, 4, 1099, 0),
(9, 3, 1, 1049, 0),
(10, 3, 2, 1049, 0),
(11, 3, 3, 1049, 0),
(12, 3, 4, 1049, 0),
(13, 4, 1, 1099, 0),
(14, 4, 2, 1099, 0),
(15, 4, 3, 1099, 0),
(16, 4, 4, 1099, 0),
(17, 5, 1, 1199, 0),
(18, 5, 2, 1199, 0),
(19, 5, 3, 1199, 0),
(20, 5, 4, 1199, 0),
(21, 6, 1, 1049, 0),
(22, 6, 2, 1049, 0),
(23, 6, 3, 1049, 0),
(24, 6, 4, 1049, 0),
(29, 7, 1, 999, 0),
(30, 7, 2, 999, 0),
(31, 7, 3, 999, 0),
(32, 7, 4, 999, 0),
(41, 10, 1, 899, 0),
(42, 10, 2, 899, 0),
(43, 10, 3, 899, 0),
(44, 10, 4, 899, 0),
(45, 11, 1, 1199, 0),
(46, 11, 2, 1199, 0),
(47, 11, 3, 1199, 0),
(48, 11, 4, 1199, 0),
(49, 12, 1, 799, 0),
(50, 12, 2, 799, 0),
(51, 12, 3, 799, 0),
(52, 12, 4, 799, 0),
(53, 13, 1, 999, 0),
(54, 13, 2, 1099, 0),
(55, 13, 3, 1099, 0),
(56, 13, 4, 1099, 0),
(61, 14, 1, 1099, 0),
(62, 14, 2, 1099, 0),
(63, 14, 3, 1099, 0),
(64, 14, 4, 1099, 0),
(77, 9, 1, 999, 0),
(78, 9, 2, 999, 0),
(79, 9, 3, 999, 0),
(80, 9, 4, 999, 0),
(123, 16, 1, 0, 0),
(124, 16, 2, 0, 0),
(125, 16, 3, 0, 0),
(126, 16, 4, 0, 0),
(127, 16, 5, 589, 0),
(128, 16, 6, 0, 0),
(129, 15, 1, 0, 0),
(130, 15, 2, 0, 0),
(131, 15, 3, 0, 0),
(132, 15, 4, 0, 0),
(133, 15, 5, 850, 0),
(134, 15, 6, 0, 0),
(147, 8, 1, 1499, 0),
(148, 8, 2, 1299, 0),
(149, 8, 3, 1299, 0),
(150, 8, 4, 1299, 0),
(151, 8, 5, 0, 0),
(152, 8, 6, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `master_style_size`
--

CREATE TABLE `master_style_size` (
  `id` int(11) NOT NULL,
  `style_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_style_size`
--

INSERT INTO `master_style_size` (`id`, `style_id`, `size_id`, `status`) VALUES
(1, 1, 10, 1),
(2, 1, 11, 1),
(3, 1, 12, 1),
(4, 1, 13, 1),
(5, 1, 14, 1),
(6, 1, 15, 1),
(7, 2, 9, 1),
(8, 2, 10, 1),
(9, 2, 11, 1),
(10, 2, 12, 1),
(11, 2, 13, 1),
(12, 2, 14, 1),
(13, 2, 15, 1),
(14, 3, 10, 1),
(15, 3, 11, 1),
(16, 3, 12, 1),
(17, 3, 13, 1),
(18, 3, 14, 1),
(19, 3, 15, 1),
(20, 4, 9, 1),
(21, 4, 10, 1),
(22, 4, 11, 1),
(23, 4, 12, 1),
(24, 4, 13, 1),
(25, 4, 14, 1),
(26, 5, 9, 1),
(27, 5, 10, 1),
(28, 5, 11, 1),
(29, 5, 12, 1),
(30, 5, 13, 1),
(31, 5, 14, 1),
(32, 6, 10, 1),
(33, 6, 11, 1),
(34, 6, 12, 1),
(35, 6, 13, 1),
(36, 6, 14, 1),
(37, 6, 15, 1),
(44, 7, 10, 1),
(45, 7, 11, 1),
(46, 7, 12, 1),
(47, 7, 13, 1),
(48, 7, 14, 1),
(49, 7, 15, 1),
(62, 10, 10, 1),
(63, 10, 11, 1),
(64, 10, 12, 1),
(65, 10, 13, 1),
(66, 10, 14, 1),
(67, 10, 15, 1),
(68, 11, 9, 1),
(69, 11, 10, 1),
(70, 11, 11, 1),
(71, 11, 12, 1),
(72, 11, 13, 1),
(73, 11, 14, 1),
(74, 12, 10, 1),
(75, 12, 11, 1),
(76, 12, 12, 1),
(77, 12, 13, 1),
(78, 12, 14, 1),
(79, 12, 15, 1),
(80, 13, 10, 1),
(81, 13, 11, 1),
(82, 13, 12, 1),
(83, 13, 13, 1),
(84, 13, 14, 1),
(85, 13, 15, 1),
(92, 14, 9, 1),
(93, 14, 10, 1),
(94, 14, 11, 1),
(95, 14, 12, 1),
(96, 14, 13, 1),
(97, 14, 14, 1),
(116, 9, 10, 1),
(117, 9, 11, 1),
(118, 9, 12, 1),
(119, 9, 13, 1),
(120, 9, 14, 1),
(121, 9, 15, 1),
(156, 16, 9, 1),
(157, 16, 11, 1),
(158, 16, 13, 1),
(159, 16, 15, 1),
(160, 15, 9, 1),
(161, 15, 11, 1),
(162, 15, 13, 1),
(163, 15, 15, 1),
(176, 8, 9, 1),
(177, 8, 10, 1),
(178, 8, 11, 1),
(179, 8, 12, 1),
(180, 8, 13, 1),
(181, 8, 14, 1);

-- --------------------------------------------------------

--
-- Table structure for table `master_style_type`
--

CREATE TABLE `master_style_type` (
  `id` int(11) NOT NULL,
  `style_type` varchar(30) NOT NULL,
  `df` int(1) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_style_type`
--

INSERT INTO `master_style_type` (`id`, `style_type`, `df`, `status`, `created_date`) VALUES
(1, 'Trousers', 0, 1, '2015-03-12 10:35:35'),
(2, 'Shirts', 0, 1, '2015-03-19 07:56:21');

-- --------------------------------------------------------

--
-- Table structure for table `master_transport`
--

CREATE TABLE `master_transport` (
  `id` int(11) NOT NULL,
  `transport_name` varchar(250) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `id` int(11) NOT NULL,
  `package_slip` varchar(20) NOT NULL,
  `customer` int(11) NOT NULL,
  `no_corton` int(11) NOT NULL,
  `ship_mode` varchar(50) NOT NULL,
  `ship_date` date NOT NULL,
  `origin` varchar(50) NOT NULL,
  `destination` varchar(100) NOT NULL,
  `lr_no` varchar(20) NOT NULL,
  `llr_no` varchar(20) NOT NULL,
  `sales_order_list` varchar(100) NOT NULL,
  `total_qty` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `package_details`
--

CREATE TABLE `package_details` (
  `id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `style_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `corton_no` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `p_c_mrp` varchar(6) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `po`
--

CREATE TABLE `po` (
  `id` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `customer` int(11) NOT NULL,
  `grn_no` varchar(15) NOT NULL,
  `lot_no` varchar(15) NOT NULL,
  `inv_date` datetime NOT NULL,
  `st` float NOT NULL,
  `cst` float NOT NULL,
  `vat` float NOT NULL,
  `remarks` varchar(300) NOT NULL,
  `full_total` int(11) NOT NULL,
  `net_total` float(10,2) NOT NULL,
  `delivery_schedule` varchar(50) NOT NULL,
  `delivery_at` varchar(50) NOT NULL,
  `mode_of_payment` varchar(50) NOT NULL,
  `delivery_status` int(1) NOT NULL DEFAULT '0',
  `complete_remarks` varchar(250) NOT NULL DEFAULT '-',
  `purchase_receipt_status` int(11) NOT NULL DEFAULT '0',
  `df` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `po_details`
--

CREATE TABLE `po_details` (
  `id` int(11) NOT NULL,
  `gen_id` int(11) NOT NULL,
  `style_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `lot_no` varchar(20) NOT NULL,
  `size_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `landed` varchar(10) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_invoice_receipt`
--

CREATE TABLE `purchase_invoice_receipt` (
  `id` int(11) NOT NULL,
  `receipt_no` varchar(20) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `agent_comm` float NOT NULL,
  `inv_list` varchar(500) NOT NULL,
  `total_amount` float NOT NULL,
  `due_date` date NOT NULL,
  `complete_status` int(1) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_invoice_receipt_bill`
--

CREATE TABLE `purchase_invoice_receipt_bill` (
  `id` int(11) NOT NULL,
  `receipt_id` int(11) NOT NULL,
  `bill_amount` float NOT NULL,
  `discount` float NOT NULL,
  `discount_per` varchar(6) NOT NULL,
  `terms` int(1) NOT NULL,
  `ac_no` varchar(30) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `dd_no` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_receipt`
--

CREATE TABLE `purchase_receipt` (
  `id` int(11) NOT NULL,
  `receipt_no` varchar(20) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `agent_comm` float NOT NULL,
  `inv_list` varchar(500) NOT NULL,
  `total_amount` float NOT NULL,
  `due_date` date NOT NULL,
  `inv_date` date NOT NULL,
  `debit` varchar(10) NOT NULL,
  `debit_per` varchar(10) NOT NULL,
  `tax_per` varchar(10) NOT NULL,
  `tax_value` varchar(10) NOT NULL,
  `net_value` varchar(10) NOT NULL,
  `inv_value` int(11) NOT NULL,
  `debit_note` varchar(10) NOT NULL,
  `debit_file` varchar(250) NOT NULL,
  `remark` varchar(150) NOT NULL,
  `inv_no` varchar(30) NOT NULL,
  `complete_status` int(1) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_receipt_bill`
--

CREATE TABLE `purchase_receipt_bill` (
  `id` int(11) NOT NULL,
  `receipt_id` int(11) NOT NULL,
  `bill_amount` float NOT NULL,
  `discount` float NOT NULL,
  `terms` int(1) NOT NULL,
  `ac_no` varchar(30) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `dd_no` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_receipt_grn`
--

CREATE TABLE `purchase_receipt_grn` (
  `id` int(11) NOT NULL,
  `pr_id` int(11) NOT NULL,
  `po_id` int(11) NOT NULL,
  `gen_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `receipt`
--

CREATE TABLE `receipt` (
  `id` int(11) NOT NULL,
  `receipt_no` varchar(20) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `agent_comm` float NOT NULL,
  `inv_list` varchar(500) NOT NULL,
  `total_amount` float NOT NULL,
  `due_date` date NOT NULL,
  `complete_status` int(1) NOT NULL DEFAULT '0',
  `commission_status` int(1) NOT NULL DEFAULT '0',
  `first_commission_status` int(1) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `receipt_bill`
--

CREATE TABLE `receipt_bill` (
  `id` int(11) NOT NULL,
  `receipt_id` int(11) NOT NULL,
  `bill_amount` float NOT NULL,
  `discount` float NOT NULL,
  `discount_per` varchar(10) NOT NULL,
  `terms` int(1) NOT NULL,
  `ac_no` varchar(30) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `dd_no` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sales_order`
--

CREATE TABLE `sales_order` (
  `id` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `customer` int(11) NOT NULL,
  `grn_no` varchar(15) NOT NULL,
  `inv_no` varchar(10) NOT NULL,
  `inv_date` date NOT NULL,
  `full_total` int(11) NOT NULL,
  `net_value` float NOT NULL,
  `sp` float NOT NULL,
  `st` float NOT NULL,
  `cst` float NOT NULL,
  `vat` float NOT NULL,
  `net_final_total` float NOT NULL,
  `df` int(1) NOT NULL DEFAULT '0',
  `package_status` int(11) NOT NULL DEFAULT '0',
  `invoice_status` int(11) NOT NULL,
  `upload_file` varchar(100) DEFAULT '-',
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_details`
--

CREATE TABLE `sales_order_details` (
  `id` int(11) NOT NULL,
  `gen_id` int(11) NOT NULL,
  `style_id` int(11) NOT NULL,
  `lot_no` varchar(20) NOT NULL,
  `color_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `c_mrp` varchar(6) NOT NULL,
  `c_landed` varchar(10) NOT NULL,
  `qty` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_short_qty_details`
--

CREATE TABLE `sales_order_short_qty_details` (
  `id` int(11) NOT NULL,
  `gen_id` int(11) NOT NULL,
  `style_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `lot_no` varchar(20) NOT NULL,
  `color_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `inv_date` date NOT NULL,
  `qty` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `id` int(11) NOT NULL,
  `style_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock_details`
--

CREATE TABLE `stock_details` (
  `id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `size_value` float NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock_info`
--

CREATE TABLE `stock_info` (
  `id` int(11) NOT NULL,
  `style_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `lot_no` varchar(20) NOT NULL,
  `qty` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `finacial_year` varchar(5) NOT NULL,
  `stock_from` varchar(5) NOT NULL DEFAULT 'po',
  `c_mrp` varchar(6) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `upload_salse_order_info`
--

CREATE TABLE `upload_salse_order_info` (
  `id` int(11) NOT NULL,
  `so_id` int(11) NOT NULL,
  `style_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `payment_terms` varchar(3) NOT NULL,
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
(1, 1, 'Mr.Babu John And Baby John', 'Dhanush Clothing', '33/2943, PAROPPADI', 'MERIKUNNU (PO)', 'Calicut', 673012, '+918086008160', 'dhanushclothingclt@gmail.com', 'Punjab National Bank', 'Govindapuram', '4274008700000134', 'Punb0427400', 0, '', '45', 0, '2015-03-12 12:01:25', 0, 0, '0000-00-00 00:00:00'),
(2, 5, 'Mr.Sampath', 'Sneha Creations', 'no.5/12,chunchagatta main road,', 'Yelachenahalli', 'Bangalore', 560062, '+919611115167', 'sampathkumarj@snehacreations.in', 'Corporation Bank', ': Jayanagar 9 Th Block,Bangalore', '104612801120001', 'Corp0001046', 0, '', '90', 0, '2015-03-19 08:02:02', 0, 1, '0000-00-00 00:00:00');

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
-- Indexes for table `buying`
--
ALTER TABLE `buying`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commission`
--
ALTER TABLE `commission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commission_bill`
--
ALTER TABLE `commission_bill`
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
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_fixed`
--
ALTER TABLE `expense_fixed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_variable`
--
ALTER TABLE `expense_variable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_variable_detaills`
--
ALTER TABLE `expense_variable_detaills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gen`
--
ALTER TABLE `gen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gen_details`
--
ALTER TABLE `gen_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `increment_table`
--
ALTER TABLE `increment_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_code`
--
ALTER TABLE `item_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_category`
--
ALTER TABLE `master_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_colour`
--
ALTER TABLE `master_colour`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_fit`
--
ALTER TABLE `master_fit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_season`
--
ALTER TABLE `master_season`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_size`
--
ALTER TABLE `master_size`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_state`
--
ALTER TABLE `master_state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_style`
--
ALTER TABLE `master_style`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_style_color`
--
ALTER TABLE `master_style_color`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_style_mrp`
--
ALTER TABLE `master_style_mrp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_style_size`
--
ALTER TABLE `master_style_size`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_style_type`
--
ALTER TABLE `master_style_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_transport`
--
ALTER TABLE `master_transport`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_details`
--
ALTER TABLE `package_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `po`
--
ALTER TABLE `po`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `po_details`
--
ALTER TABLE `po_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_invoice_receipt`
--
ALTER TABLE `purchase_invoice_receipt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_invoice_receipt_bill`
--
ALTER TABLE `purchase_invoice_receipt_bill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_receipt`
--
ALTER TABLE `purchase_receipt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_receipt_bill`
--
ALTER TABLE `purchase_receipt_bill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_receipt_grn`
--
ALTER TABLE `purchase_receipt_grn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receipt`
--
ALTER TABLE `receipt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receipt_bill`
--
ALTER TABLE `receipt_bill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_order`
--
ALTER TABLE `sales_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_order_details`
--
ALTER TABLE `sales_order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_order_short_qty_details`
--
ALTER TABLE `sales_order_short_qty_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_details`
--
ALTER TABLE `stock_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_info`
--
ALTER TABLE `stock_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upload_salse_order_info`
--
ALTER TABLE `upload_salse_order_info`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `buying`
--
ALTER TABLE `buying`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `commission`
--
ALTER TABLE `commission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `commission_bill`
--
ALTER TABLE `commission_bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `company_details`
--
ALTER TABLE `company_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `expense`
--
ALTER TABLE `expense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `expense_fixed`
--
ALTER TABLE `expense_fixed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `expense_variable`
--
ALTER TABLE `expense_variable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `expense_variable_detaills`
--
ALTER TABLE `expense_variable_detaills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gen`
--
ALTER TABLE `gen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gen_details`
--
ALTER TABLE `gen_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `increment_table`
--
ALTER TABLE `increment_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `item_code`
--
ALTER TABLE `item_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `master_category`
--
ALTER TABLE `master_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `master_colour`
--
ALTER TABLE `master_colour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `master_fit`
--
ALTER TABLE `master_fit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `master_season`
--
ALTER TABLE `master_season`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `master_size`
--
ALTER TABLE `master_size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `master_state`
--
ALTER TABLE `master_state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `master_style`
--
ALTER TABLE `master_style`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `master_style_color`
--
ALTER TABLE `master_style_color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;
--
-- AUTO_INCREMENT for table `master_style_mrp`
--
ALTER TABLE `master_style_mrp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;
--
-- AUTO_INCREMENT for table `master_style_size`
--
ALTER TABLE `master_style_size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;
--
-- AUTO_INCREMENT for table `master_style_type`
--
ALTER TABLE `master_style_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `master_transport`
--
ALTER TABLE `master_transport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `package_details`
--
ALTER TABLE `package_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `po`
--
ALTER TABLE `po`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `po_details`
--
ALTER TABLE `po_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `purchase_invoice_receipt`
--
ALTER TABLE `purchase_invoice_receipt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `purchase_invoice_receipt_bill`
--
ALTER TABLE `purchase_invoice_receipt_bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `purchase_receipt`
--
ALTER TABLE `purchase_receipt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `purchase_receipt_bill`
--
ALTER TABLE `purchase_receipt_bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `purchase_receipt_grn`
--
ALTER TABLE `purchase_receipt_grn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `receipt`
--
ALTER TABLE `receipt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `receipt_bill`
--
ALTER TABLE `receipt_bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sales_order`
--
ALTER TABLE `sales_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sales_order_details`
--
ALTER TABLE `sales_order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sales_order_short_qty_details`
--
ALTER TABLE `sales_order_short_qty_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `stock_details`
--
ALTER TABLE `stock_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `stock_info`
--
ALTER TABLE `stock_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `upload_salse_order_info`
--
ALTER TABLE `upload_salse_order_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
