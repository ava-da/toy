-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 27, 2016 at 02:47 AM
-- Server version: 5.5.47-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sportavaran`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `family` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `mobile` varchar(20) COLLATE utf8_persian_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_persian_ci NOT NULL,
  `address` tinytext COLLATE utf8_persian_ci NOT NULL,
  `city` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `provience` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `postalcod` varchar(15) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `family`, `email`, `mobile`, `phone`, `address`, `city`, `provience`, `postalcod`) VALUES
(1, 'آوا', 'دارابی', 'ava_da89@yahoo.com', '098765432', '3456789', 'آدرس آوا', 'تهران', 'تهران', '۱۲۳۴۵۶۷۸۹۰'),
(2, 'حمید', 'کریمی', 'me@hamid-karimi.com', '۰۹۸۷۶۵۴۳', '۱۲۳۴۵۶۷۸', 'آدرس حمید', 'تهران', 'تهران', '۰۹۸۷۶۵۴۳۲');

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) COLLATE utf8_persian_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1466968756),
('m130524_201442_init', 1466968758);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `customerId` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `code`, `customerId`, `date`) VALUES
(1, 'dfsf', 2, 1234567890),
(2, '44-99', 1, 1467527710),
(3, 'سفارش اوا', 1, 1467895464);

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE IF NOT EXISTS `order_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `product` varchar(300) COLLATE utf8_persian_ci DEFAULT NULL,
  `productCode` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `customize` text COLLATE utf8_persian_ci,
  `size` varchar(10) COLLATE utf8_persian_ci DEFAULT NULL,
  `postType` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
  `cardDigit` int(11) DEFAULT NULL,
  `bankTrack` varchar(50) COLLATE utf8_persian_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `shipping` int(11) DEFAULT NULL,
  `extraPayment` int(11) DEFAULT NULL,
  `totalPrice` int(11) DEFAULT NULL,
  `registerCode` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `lastLvl` int(11) DEFAULT NULL,
  `lastStatus` int(11) DEFAULT NULL,
  `date` int(11) NOT NULL,
  `internationalProductCode` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `paymentDate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci AUTO_INCREMENT=16 ;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`id`, `orderId`, `product`, `productCode`, `count`, `customize`, `size`, `postType`, `cardDigit`, `bankTrack`, `price`, `shipping`, `extraPayment`, `totalPrice`, `registerCode`, `lastLvl`, `lastStatus`, `date`, `internationalProductCode`, `paymentDate`) VALUES
(1, 2, 'sadas', '12312', 21, 'asdas', '12', '121', 1212, '123123', 123123, 12312, 12, 1212, '', 3, 5, 1467894058, '', '0000-00-00'),
(2, 2, 'sadas', '12312', 21, 'asdas', '12', '121', 1212, '123123', 123123, 12312, 12, 1212, '', 10, 23, 1469569891, '', '0000-00-00'),
(3, 2, 'sadas', '12312', 21, 'asdas', '12', '121', 1212, '123123', 123123, 12312, 12, 1212, '', 11, 2, 1467893578, '', '0000-00-00'),
(4, 1, 'dfdfgs', '3423', 3223, '23wewer', '32', '2342', 423423, '23423', 2342, 34234, 234234, 342342, '', 9, 21, 1469569066, '', '0000-00-00'),
(5, 1, 'sda', '312', 12, 'sdfasdfasdfasd', '213', '13', 31231, '123123', 12312, 12312, 1231, 13123, '', 6, 16, 1469569001, '', '0000-00-00'),
(6, 1, 'sda', '312', 12, 'sdfasdfasdfasd', '213', '13', 31231, '123123', 12312, 12312, 1231, 13123, '', 5, 2, 1467893921, '', '0000-00-00'),
(7, 1, 'sda', '312', 12, 'sdfasdfasdfasd', '213', '13', 31231, '123123', 12312, 12312, 1231, 13123, '', 3, 5, 1467894962, '', '0000-00-00'),
(8, 1, 'fdfsf', '2342', 23, 'dads', '32', '33', 33, '33', 3, 3, 3, 3, '', 3, 4, 1469561190, '', '0000-00-00'),
(9, 1, 'fdfsf', '2342', 23, 'dads', '32', '33', 33, '33', 3, 3, 3, 3, '', 3, 4, 1469561877, '', '0000-00-00'),
(10, 1, 'fdfsf', '2342', 23, 'dads', '32', '33', 33, '33', 3, 3, 3, 3, '', 3, 4, 1469564981, '', '0000-00-00'),
(11, 1, 'fdfsf', '2342', 23, 'dads', '32', '33', 33, '33', 3, 3, 3, 3, '', 2, NULL, 1469561857, '', '0000-00-00'),
(12, 1, 'dssd', 'sdasd', 342, '', '23', '2323', 234324, '23423', 23423, 42342, NULL, 23423, '', 3, 4, 1469565832, '', '0000-00-00'),
(13, 3, 'کفش نایکی', 'nk-12', 1, '', '38', 'ir', 5358, '1234567890', 120000, 120000, 12, 2345678, '', 11, 24, 1468336922, '', '0000-00-00'),
(14, 3, 'کفش ریباک', '90-22', 1, '', '39', 'ir', 5358, '1234567890', 3000, 3500, NULL, 100000, '', 8, 25, 1468337108, '', '0000-00-00'),
(15, 3, 'کفش ادیداس', 'ad-11', 1, '', '37', 'ir', 5358, '0987654321', 30000, 900000, NULL, 120000, '', 3, 5, 1468332609, '', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `order_track`
--

CREATE TABLE IF NOT EXISTS `order_track` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `statusId` int(11) NOT NULL,
  `comment` text COLLATE utf8_persian_ci NOT NULL,
  `trackingId` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  `statusDate` date NOT NULL,
  `post` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `cardNumber` varchar(25) COLLATE utf8_persian_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `reason` text COLLATE utf8_persian_ci NOT NULL,
  `bankTrackId` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci AUTO_INCREMENT=57 ;

--
-- Dumping data for table `order_track`
--

INSERT INTO `order_track` (`id`, `date`, `userId`, `productId`, `statusId`, `comment`, `trackingId`, `statusDate`, `post`, `cardNumber`, `amount`, `reason`, `bankTrackId`) VALUES
(1, 1467549041, 1, 10, 1, '', '', '0000-00-00', '', '', 0, '', ''),
(2, 1467549058, 1, 11, 1, '', '', '0000-00-00', '', '', 0, '', ''),
(3, 1467811923, 1, 12, 1, '', '', '0000-00-00', '', '', 0, '', ''),
(4, 1467893578, 1, 3, 2, '', '', '0000-00-00', '', '', 0, '', ''),
(5, 1467893593, 1, 4, 2, '', '', '0000-00-00', '', '', 0, '', ''),
(6, 1467893708, 1, 5, 2, '', '', '0000-00-00', '', '', 0, '', ''),
(7, 1467893921, 1, 6, 2, '', '', '0000-00-00', '', '', 0, '', ''),
(8, 1467893966, 1, 7, 2, 'ddddddd', '', '0000-00-00', '', '', 0, '', ''),
(9, 1467894058, 1, 1, 5, 'yyyyyyyy', '', '0000-00-00', '', '', 0, '', ''),
(10, 1467894173, 1, 2, 4, '', '', '0000-00-00', '', '', 0, '', ''),
(11, 1467894346, 1, 4, 4, '', '', '0000-00-00', '', '', 0, '', ''),
(12, 1467894563, 1, 5, 4, '', '', '0000-00-00', '', '', 0, '', ''),
(13, 1467894962, 1, 7, 5, 'ssssss', '', '0000-00-00', '', '', 0, '', ''),
(14, 1467895511, 1, 13, 1, '', '', '0000-00-00', '', '', 0, '', ''),
(15, 1467895598, 1, 14, 1, '', '', '0000-00-00', '', '', 0, '', ''),
(16, 1467895655, 1, 15, 1, '', '', '0000-00-00', '', '', 0, '', ''),
(17, 1467895683, 1, 13, 3, 'ثبت شد', '', '0000-00-00', '', '', 0, '', ''),
(18, 1467895701, 1, 14, 3, 'اینم ثبت شد', '', '0000-00-00', '', '', 0, '', ''),
(19, 1467895713, 1, 15, 2, '', '', '0000-00-00', '', '', 0, '', ''),
(20, 1468332584, 1, 13, 4, 'OK', '', '0000-00-00', '', '', 0, '', ''),
(21, 1468332596, 1, 14, 4, 'OK REEBOK', '', '0000-00-00', '', '', 0, '', ''),
(22, 1468332609, 1, 15, 5, 'NIST', '', '0000-00-00', '', '', 0, '', ''),
(23, 1468335229, 1, 13, 7, '', '', '0000-00-00', '', '', 0, '', ''),
(24, 1468335751, 1, 13, 15, '', '', '0000-00-00', '', '', 0, '', ''),
(25, 1468335880, 1, 13, 16, '', '', '0000-00-00', '', '', 0, '', ''),
(26, 1468335954, 1, 13, 18, '', '', '0000-00-00', '', '', 0, '', ''),
(27, 1468336209, 1, 13, 19, '', '', '0000-00-00', '', '', 0, '', ''),
(28, 1468336304, 1, 13, 21, '', '', '0000-00-00', '', '', 0, '', ''),
(29, 1468336871, 1, 13, 23, '', '', '0000-00-00', '', '', 0, '', ''),
(30, 1468336922, 1, 13, 24, '', '', '0000-00-00', '', '', 0, '', ''),
(31, 1468337070, 1, 14, 7, '', '', '0000-00-00', '', '', 0, '', ''),
(32, 1468337079, 1, 14, 15, '', '', '0000-00-00', '', '', 0, '', ''),
(33, 1468337090, 1, 14, 16, '', '', '0000-00-00', '', '', 0, '', ''),
(34, 1468337099, 1, 14, 18, '', '', '0000-00-00', '', '', 0, '', ''),
(35, 1468337108, 1, 14, 25, '', '', '0000-00-00', '', '', 0, '', ''),
(36, 1469560683, 1, 8, 3, '', '', '0000-00-00', '', '', 0, '', ''),
(37, 1469561190, 1, 8, 4, '', '245g', '0000-00-00', '', '', 0, '', ''),
(38, 1469561849, 1, 10, 3, '', '', '0000-00-00', '', '', 0, '', ''),
(39, 1469561877, 1, 9, 4, 'dsfdfs', '123456', '0000-00-00', '', '', 0, '', ''),
(40, 1469564981, 1, 10, 4, '', '34234', '2016-07-13', '0', '', 0, '', ''),
(41, 1469565812, 1, 12, 3, 'sDAS', '', '2016-07-05', '', '', 0, '', ''),
(42, 1469565832, 1, 12, 4, 'FFFF', 'ADDW2', '2016-07-06', '0', '', 0, '', ''),
(43, 1469565896, 1, 2, 7, 'dfsdfs', '', '2016-07-06', '', '', 0, '', ''),
(44, 1469565911, 1, 2, 15, '', '', '2016-07-08', '', '', 0, '', ''),
(45, 1469565925, 1, 2, 17, 'dsfdf', '', '2016-07-08', '', '', 0, '', ''),
(46, 1469566223, 1, 2, 18, '', '', '2016-07-15', '', '', 0, '', ''),
(47, 1469567679, 1, 2, 19, '', '', '2016-07-05', '', '', 0, '', ''),
(48, 1469568477, 1, 2, 22, '', '', '2016-07-06', '', '', 0, '', ''),
(49, 1469568904, 1, 4, 7, '', '', '2016-07-07', '', '', 0, '', ''),
(50, 1469568918, 1, 4, 15, '', '', '2016-07-05', '', '', 0, '', ''),
(51, 1469568980, 1, 5, 15, '', '', '2016-07-12', '', '', 0, '', ''),
(52, 1469569001, 1, 5, 16, '', '', '2016-07-05', '', '', 0, '', ''),
(53, 1469569013, 1, 4, 18, '', '', '2016-07-13', '', '', 0, '', ''),
(54, 1469569031, 1, 4, 20, '', '', '2016-07-05', '', '', 0, '', ''),
(55, 1469569066, 1, 4, 21, '', '', '2016-07-13', '', '', 0, '', ''),
(56, 1469569891, 1, 2, 23, '', '', '2016-07-05', '', '', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `lvl` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci AUTO_INCREMENT=26 ;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `title`, `lvl`) VALUES
(1, 'ثبت سفارش جدید', 1),
(2, '‫نیست‬ ‫موجود‬', 2),
(3, '‫‫شد‬ ‫ثبت‬ ‫انگلستان‬ ‫در‬', 2),
(4, '‫‫شد‬ ‫تایید‬ ‫انگلستان‬ ‫در‬', 3),
(5, '‫‫نیست‬ ‫موجود‬ ‫انبار‬ ‫در‬', 3),
(6, '‫‫خورده‬ ‫برگشت‬ ‫و‬ ‫نبوده‬ ‫موجود‬ ‫محصول‬', 3),
(7, '‫‫شد‬ ‫ارسال‬ ‫انگلستان‬ ‫از‬', 4),
(8, '‫‫‪return‬‬ ‫‪-‬‬ ‫‪replaced‬‬', 4),
(9, '‫‫‪replaced‬‬ ‫‪-‬‬ ‫‪missing‬‬ ‫‪item‬‬', 4),
(10, '‫‫‪lost‬‬ ‫‪in‬‬ ‫‪transit‬‬', 4),
(11, '‫‪picked‬‬', 4),
(12, '‫‪dispatched‬‬ ‫‪separately‬‬', 4),
(13, '‫‪other‬‬', 4),
(14, '‫‪refunded‬‬', 4),
(15, '‫رسید‬ ‫ما‬ ‫دفتر‬ ‫به‬', 5),
(16, '‫شد‬ ‫ارسال‬ ‫مشتری‬ ‫برای‬', 6),
(17, '‫مشتری‬ ‫دیگر‬ ‫محصول‬ ‫برای‬ ‫)‪(Waiting‬‬ ‫منتظر‬', 6),
(18, '‫رسید‬ ‫مشتری‬ ‫دست‬ ‫به‬', 7),
(19, '‫زد‬ ‫برگشت‬ ‫مشتری‬', 8),
(20, '‫مشتری‬ ‫جایگزینی‬ ‫سفارش‬', 8),
(21, '‫مشتری‬ ‫هست‬ ‫بدهکار‬', 9),
(22, '‫مشتری‬ ‫هست‬ بستانکار', 9),
(23, 'دریافت شد', 10),
(24, '‫شد‬ ‫پرداخت‬', 10),
(25, 'موفقیت آمیز', 8);

-- --------------------------------------------------------

--
-- Table structure for table `status_lvl`
--

CREATE TABLE IF NOT EXISTS `status_lvl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  `nextStatus` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `status_lvl`
--

INSERT INTO `status_lvl` (`id`, `status`, `nextStatus`) VALUES
(1, 1, 2),
(2, 2, 3),
(3, 3, 4),
(4, 4, 5),
(5, 5, 6),
(6, 6, 7),
(7, 7, 8),
(8, 8, 9),
(9, 9, 10),
(10, 10, 11);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'UBWzEeQZ5_nE6_ZT8lAG7sUrcu5Pwf61', '$2y$13$2AxWawisgFgA1VDubd/u1uold93juiMi.E36AGTJYZca6PDISSzsO', NULL, 'admin@example.com', 10, 1466968764, 1466968764);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
