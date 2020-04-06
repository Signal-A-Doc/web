-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 02, 2020 at 07:02 PM
-- Server version: 5.7.29-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toxsl_signla`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_api_device_detail`
--

CREATE TABLE `tbl_api_device_detail` (
  `id` int(11) NOT NULL,
  `device_token` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `device_name` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_type` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `type_id` int(11) DEFAULT '0',
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_api_device_detail`
--

INSERT INTO `tbl_api_device_detail` (`id`, `device_token`, `device_name`, `device_type`, `type_id`, `created_on`, `updated_on`, `created_by_id`) VALUES
(148, '9826005b19cf171b', 'Mi A2', '1', 0, '2020-03-17 19:49:04', '2020-03-18 17:59:20', 148),
(162, '565b4f2be189deda', '', '1', 0, '2020-03-18 21:45:31', '2020-03-18 21:45:31', 150),
(164, 'da4e44da3315238b', '', '1', 0, '2020-03-24 10:51:52', '2020-03-24 10:51:52', 170),
(171, 'a402b953f5205639', 'SM-G965N', '1', 0, '2020-03-24 23:49:09', '2020-03-31 23:08:54', 176),
(184, '32a2d03f1fb35194', '', '1', 0, '2020-03-25 16:42:12', '2020-03-25 16:42:12', 180),
(186, '813467dc08d04df5', '', '1', 0, '2020-03-25 19:02:39', '2020-03-25 19:02:39', 182),
(192, '52f3d7d1e9a9dba0', 'SM-M205F', '1', 0, '2020-03-26 15:26:25', '2020-03-26 15:54:27', 187),
(195, '71eb4018b31ac6e1', 'BBF100-1', '1', 0, '2020-03-26 21:51:33', '2020-03-31 21:58:16', 190),
(196, '696a5247e5a2ad70', 'MRD-LX1F', '1', 0, '2020-03-27 11:08:39', '2020-04-02 14:52:44', 153),
(211, '021d3197946c8cda', 'Mi A2', '1', 0, '2020-03-31 16:56:52', '2020-04-02 15:37:42', 196),
(212, 'bdf446ca9b31e9aa', 'SM-G960F', '1', 0, '2020-03-31 20:38:20', '2020-03-31 21:16:06', 198),
(218, '4bbc0cb58bfe1691', 'Android SDK built for x86', '1', 0, '2020-04-02 16:51:48', '2020-04-02 18:16:05', 179),
(228, '021d3197946c8cda', '', '1', 0, '2020-04-02 18:06:00', '2020-04-02 18:06:00', 201),
(229, '42e7c2f5d12cc003', '', '1', 0, '2020-04-02 18:58:48', '2020-04-02 18:58:48', 184);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_appointment`
--

CREATE TABLE `tbl_appointment` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `availability_id` int(11) DEFAULT NULL,
  `availability_time_id` int(11) NOT NULL,
  `document_ids` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `health_issue` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `reschedule_reason` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cancel_reason` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_status` int(11) NOT NULL DEFAULT '0',
  `age` int(11) DEFAULT NULL,
  `price` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `discount` int(11) NOT NULL DEFAULT '0',
  `final_price` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `prescription_image` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `state_id` int(11) NOT NULL DEFAULT '1',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_appointment`
--

INSERT INTO `tbl_appointment` (`id`, `doctor_id`, `availability_id`, `availability_time_id`, `document_ids`, `name`, `health_issue`, `reschedule_reason`, `cancel_reason`, `payment_status`, `age`, `price`, `discount`, `final_price`, `gender`, `date`, `time`, `prescription_image`, `type_id`, `state_id`, `created_on`, `updated_on`, `created_by_id`) VALUES
(11, 200, 1, 106, NULL, '', '', NULL, NULL, 0, NULL, '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, '2020-04-02 17:56:12', '2020-04-02 17:56:12', 179),
(12, 201, 1, 128, NULL, '', '', NULL, NULL, 0, NULL, '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, '2020-04-02 18:00:26', '2020-04-02 18:00:26', 179),
(13, 201, 1, 128, NULL, '', '', NULL, NULL, 0, NULL, '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, '2020-04-02 18:00:39', '2020-04-02 18:00:39', 179),
(14, 200, 1, 106, NULL, '', '', NULL, NULL, 0, NULL, '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, '2020-04-02 18:04:31', '2020-04-02 18:04:31', 179),
(15, 200, 1, 120, NULL, '', '', NULL, NULL, 0, NULL, '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, '2020-04-02 18:17:33', '2020-04-02 18:17:33', 179);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_appointment_illness`
--

CREATE TABLE `tbl_appointment_illness` (
  `id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `illness_id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `state_id` int(11) NOT NULL DEFAULT '1',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_appointment_plans`
--

CREATE TABLE `tbl_appointment_plans` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `amount` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `state_id` int(11) DEFAULT '1',
  `type_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_appointment_question`
--

CREATE TABLE `tbl_appointment_question` (
  `id` int(11) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `state_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_appointment_question_multiple_type`
--

CREATE TABLE `tbl_appointment_question_multiple_type` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `state_id` int(11) DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_availability_time`
--

CREATE TABLE `tbl_availability_time` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `doctor_availability_id` int(11) DEFAULT NULL,
  `start_time` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `end_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state_id` int(11) DEFAULT '1',
  `type_id` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_availability_time`
--

INSERT INTO `tbl_availability_time` (`id`, `date`, `doctor_availability_id`, `start_time`, `end_time`, `price`, `description`, `state_id`, `type_id`, `created_on`, `updated_on`, `created_by_id`) VALUES
(106, '2020-04-02', 90, '17:48:59', '18:48:59', '', '', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(107, '2020-04-03', 91, '17:48:59', '18:48:59', '', '', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(108, '2020-04-04', 92, '17:48:59', '18:48:59', '', '', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(109, '2020-04-05', 93, '17:48:59', '18:48:59', '', '', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(110, '2020-04-06', 94, '17:48:59', '18:48:59', '', '', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(111, '2020-04-07', 95, '17:48:59', '18:48:59', '', '', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(112, '2020-04-08', 96, '17:48:59', '18:48:59', '', '', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(113, '2020-04-09', 97, '17:48:59', '18:48:59', '', '', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(114, '2020-04-10', 98, '17:48:59', '18:48:59', '', '', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(115, '2020-04-11', 99, '17:48:59', '18:48:59', '', '', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(116, '2020-04-12', 100, '17:48:59', '18:48:59', '', '', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(117, '2020-04-13', 101, '17:48:59', '18:48:59', '', '', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(118, '2020-04-14', 102, '17:48:59', '18:48:59', '', '', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(119, '2020-04-15', 103, '17:48:59', '18:48:59', '', '', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(120, '2020-04-16', 104, '17:48:59', '18:48:59', '', '', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(121, '2020-04-17', 105, '17:48:59', '18:48:59', '', '', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(122, '2020-04-18', 106, '17:48:59', '18:48:59', '', '', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(123, '2020-04-19', 107, '17:48:59', '18:48:59', '', '', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(124, '2020-04-20', 108, '17:48:59', '18:48:59', '', '', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(125, '2020-04-21', 109, '17:48:59', '18:48:59', '', '', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(126, '2020-04-22', 110, '17:48:59', '18:48:59', '', '', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(127, '2020-04-23', 111, '17:48:59', '18:48:59', '', '', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(128, '2020-04-02', 112, '17:51:46', '18:51:46', '', '', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(129, '2020-04-03', 113, '17:51:46', '18:51:46', '', '', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(130, '2020-04-04', 114, '17:51:46', '18:51:46', '', '', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(131, '2020-04-05', 115, '17:51:46', '18:51:46', '', '', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(132, '2020-04-06', 116, '17:51:46', '18:51:46', '', '', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(133, '2020-04-07', 117, '17:51:46', '18:51:46', '', '', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(134, '2020-04-08', 118, '17:51:46', '18:51:46', '', '', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(135, '2020-04-09', 119, '17:51:46', '18:51:46', '', '', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(136, '2020-04-10', 120, '17:51:46', '18:51:46', '', '', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(137, '2020-04-11', 121, '17:51:46', '18:51:46', '', '', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(138, '2020-04-12', 122, '17:51:46', '18:51:46', '', '', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(139, '2020-04-13', 123, '17:51:46', '18:51:46', '', '', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(140, '2020-04-14', 124, '17:51:46', '18:51:46', '', '', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(141, '2020-04-15', 125, '17:51:46', '18:51:46', '', '', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(142, '2020-04-16', 126, '17:51:46', '18:51:46', '', '', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(143, '2020-04-17', 127, '17:51:46', '18:51:46', '', '', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(144, '2020-04-18', 128, '17:51:46', '18:51:46', '', '', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(145, '2020-04-19', 129, '17:51:46', '18:51:46', '', '', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(146, '2020-04-20', 130, '17:51:46', '18:51:46', '', '', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(147, '2020-04-21', 131, '17:51:46', '18:51:46', '', '', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(148, '2020-04-22', 132, '17:51:46', '18:51:46', '', '', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(149, '2020-04-23', 133, '17:51:46', '18:51:46', '', '', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(150, '2020-04-02', 134, '17:53:51', '19:53:51', '', '', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(151, '2020-04-03', 135, '17:53:51', '19:53:51', '', '', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(152, '2020-04-04', 136, '17:53:51', '19:53:51', '', '', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(153, '2020-04-05', 137, '17:53:51', '19:53:51', '', '', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(154, '2020-04-06', 138, '17:53:51', '19:53:51', '', '', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(155, '2020-04-07', 139, '17:53:51', '19:53:51', '', '', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(156, '2020-04-08', 140, '17:53:51', '19:53:51', '', '', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(157, '2020-04-09', 141, '17:53:51', '19:53:51', '', '', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(158, '2020-04-10', 142, '17:53:51', '19:53:51', '', '', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(159, '2020-04-11', 143, '17:53:51', '19:53:51', '', '', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(160, '2020-04-12', 144, '17:53:51', '19:53:51', '', '', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(161, '2020-04-13', 145, '17:53:51', '19:53:51', '', '', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(162, '2020-04-14', 146, '17:53:51', '19:53:51', '', '', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(163, '2020-04-15', 147, '17:53:51', '19:53:51', '', '', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(164, '2020-04-16', 148, '17:53:51', '19:53:51', '', '', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(165, '2020-04-17', 149, '17:53:51', '19:53:51', '', '', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(166, '2020-04-18', 150, '17:53:51', '19:53:51', '', '', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(167, '2020-04-19', 151, '17:53:51', '19:53:51', '', '', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(168, '2020-04-20', 152, '17:53:51', '19:53:51', '', '', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(169, '2020-04-21', 153, '17:53:51', '19:53:51', '', '', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(170, '2020-04-22', 154, '17:53:51', '19:53:51', '', '', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(171, '2020-04-23', 155, '17:53:51', '19:53:51', '', '', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(172, '2020-04-24', 156, '17:53:51', '19:53:51', '', '', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(173, '2020-04-25', 157, '17:53:51', '19:53:51', '', '', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(174, '2020-04-26', 158, '17:53:51', '19:53:51', '', '', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(175, '2020-04-27', 159, '17:53:51', '19:53:51', '', '', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(176, '2020-04-28', 160, '17:53:51', '19:53:51', '', '', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(177, '2020-04-29', 161, '17:53:51', '19:53:51', '', '', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(178, '2020-04-30', 162, '17:53:51', '19:53:51', '', '', 1, NULL, '2020-04-02 17:53:57', '2020-04-02 17:53:57', 202);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_banner`
--

CREATE TABLE `tbl_banner` (
  `id` int(11) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `image_file` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `state_id` int(11) DEFAULT '1',
  `type_id` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_blog_category`
--

CREATE TABLE `tbl_blog_category` (
  `id` int(11) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `state_id` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_call_log`
--

CREATE TABLE `tbl_call_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `session_id` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `state_id` int(11) DEFAULT '1',
  `type_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image_file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state_id` int(11) DEFAULT '0',
  `type_id` int(11) DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `title`, `description`, `image_file`, `state_id`, `type_id`, `created_on`, `updated_on`, `created_by_id`) VALUES
(1, 'Heart Diseases', '<p>Heart Diseases</p>\r\n', 'category-1585117148-image_file-user_id_1.jpg', 1, 1, '2020-03-06 11:06:45', '2020-03-25 11:49:08', 1),
(2, 'Diabetes', '<p>Diabetes</p>\r\n', 'category-1585117028-image_file-user_id_1.png', 1, 1, '2020-03-06 11:07:00', '2020-03-25 11:47:08', 1),
(16, 'Skin Specialist', '<p>Skin Diseases</p>\r\n', 'category-1585116815-image_file-user_id_1.jpg', 1, 1, '2020-03-06 18:53:58', '2020-03-25 11:43:35', 1),
(19, 'General Health', NULL, 'category-1585809128-image_file-user_id_1.png', 1, 2, '2020-03-27 17:41:49', '2020-04-02 12:02:08', 1),
(20, 'beauty and skin care', NULL, 'category-1585820718-image_file-user_id_1.png', 1, 2, '2020-03-27 17:45:00', '2020-04-02 15:15:18', 1),
(21, 'Speech and language', NULL, 'category-1585820932-image_file-user_id_1.png', 1, 2, '2020-04-02 15:18:52', '2020-04-02 15:18:52', 1),
(22, 'Behavioral Health', NULL, 'category-1585820997-image_file-user_id_1.png', 1, 2, '2020-04-02 15:19:57', '2020-04-02 15:19:57', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category_answer`
--

CREATE TABLE `tbl_category_answer` (
  `id` int(11) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `question_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category_question`
--

CREATE TABLE `tbl_category_question` (
  `id` int(11) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `repeated_type` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_category_question`
--

INSERT INTO `tbl_category_question` (`id`, `title`, `category_id`, `repeated_type`, `state_id`, `created_on`, `updated_on`, `created_by_id`, `type_id`) VALUES
(1, 'vdfvd', 2, 0, 1, '2020-03-25 12:05:10', '2020-03-25 12:05:10', 1, 1),
(2, 'Diabetes', 2, 0, 1, '2020-03-26 11:48:19', '2020-03-26 11:48:19', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category_question_repeate_type`
--

CREATE TABLE `tbl_category_question_repeate_type` (
  `id` int(11) NOT NULL,
  `category_question_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL DEFAULT '0',
  `type_id` tinyint(1) DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comment`
--

CREATE TABLE `tbl_comment` (
  `id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `comment` text,
  `state_id` int(11) DEFAULT '1',
  `type_id` int(11) DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_consultation_availability`
--

CREATE TABLE `tbl_consultation_availability` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state_id` int(11) DEFAULT '0',
  `type_id` int(11) DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_consultation_availability`
--

INSERT INTO `tbl_consultation_availability` (`id`, `title`, `image_file`, `state_id`, `type_id`, `created_on`, `updated_on`, `created_by_id`) VALUES
(1, 'Call Consulatition', 'consultation-availability-1585824225-image_file-user_id_1.png', 1, 0, '2020-03-27 11:09:20', '2020-04-02 16:13:45', 1),
(2, 'Video Call Consultation', 'consultation-availability-1585824302-image_file-user_id_1.png', 1, 0, '2020-03-27 11:12:49', '2020-04-02 16:15:02', 1),
(3, 'Chat Consultation', 'consultation-availability-1585824354-image_file-user_id_1.png', 1, 0, '2020-04-02 16:15:54', '2020-04-02 16:15:54', 1),
(4, 'Face to Face Consultation', 'consultation-availability-1585824406-image_file-user_id_1.png', 1, 0, '2020-04-02 16:16:46', '2020-04-02 16:16:46', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_doctor_availability`
--

CREATE TABLE `tbl_doctor_availability` (
  `id` int(11) NOT NULL,
  `date` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `state_id` int(11) DEFAULT '1',
  `type_id` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_doctor_availability`
--

INSERT INTO `tbl_doctor_availability` (`id`, `date`, `state_id`, `type_id`, `created_on`, `updated_on`, `created_by_id`) VALUES
(90, '2020-04-02', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(91, '2020-04-03', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(92, '2020-04-04', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(93, '2020-04-05', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(94, '2020-04-06', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(95, '2020-04-07', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(96, '2020-04-08', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(97, '2020-04-09', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(98, '2020-04-10', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(99, '2020-04-11', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(100, '2020-04-12', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(101, '2020-04-13', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(102, '2020-04-14', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(103, '2020-04-15', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(104, '2020-04-16', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(105, '2020-04-17', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(106, '2020-04-18', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(107, '2020-04-19', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(108, '2020-04-20', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(109, '2020-04-21', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(110, '2020-04-22', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(111, '2020-04-23', 1, NULL, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(112, '2020-04-02', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(113, '2020-04-03', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(114, '2020-04-04', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(115, '2020-04-05', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(116, '2020-04-06', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(117, '2020-04-07', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(118, '2020-04-08', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(119, '2020-04-09', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(120, '2020-04-10', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(121, '2020-04-11', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(122, '2020-04-12', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(123, '2020-04-13', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(124, '2020-04-14', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(125, '2020-04-15', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(126, '2020-04-16', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(127, '2020-04-17', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(128, '2020-04-18', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(129, '2020-04-19', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(130, '2020-04-20', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(131, '2020-04-21', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(132, '2020-04-22', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(133, '2020-04-23', 1, NULL, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(134, '2020-04-02', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(135, '2020-04-03', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(136, '2020-04-04', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(137, '2020-04-05', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(138, '2020-04-06', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(139, '2020-04-07', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(140, '2020-04-08', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(141, '2020-04-09', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(142, '2020-04-10', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(143, '2020-04-11', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(144, '2020-04-12', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(145, '2020-04-13', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(146, '2020-04-14', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(147, '2020-04-15', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(148, '2020-04-16', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(149, '2020-04-17', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(150, '2020-04-18', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(151, '2020-04-19', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(152, '2020-04-20', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(153, '2020-04-21', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(154, '2020-04-22', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(155, '2020-04-23', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(156, '2020-04-24', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(157, '2020-04-25', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(158, '2020-04-26', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(159, '2020-04-27', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(160, '2020-04-28', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(161, '2020-04-29', 1, NULL, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(162, '2020-04-30', 1, NULL, '2020-04-02 17:53:57', '2020-04-02 17:53:57', 202);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_doctor_consultation_availability`
--

CREATE TABLE `tbl_doctor_consultation_availability` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `consultation_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_doctor_consultation_availability`
--

INSERT INTO `tbl_doctor_consultation_availability` (`id`, `user_id`, `consultation_id`, `state_id`, `created_on`, `updated_on`, `created_by_id`) VALUES
(10, 200, 1, 1, '2020-04-02 17:48:58', '2020-04-02 17:48:58', 200),
(11, 201, 1, 1, '2020-04-02 17:58:35', '2020-04-02 17:58:35', 201),
(12, 202, 4, 1, '2020-04-02 18:00:06', '2020-04-02 18:00:06', 202);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_doctor_language`
--

CREATE TABLE `tbl_doctor_language` (
  `id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `state_id` int(11) DEFAULT '1',
  `type_id` int(11) DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_doctor_language`
--

INSERT INTO `tbl_doctor_language` (`id`, `language_id`, `state_id`, `type_id`, `created_on`, `created_by_id`) VALUES
(17, 7, 1, 0, '2020-04-02 17:47:39', 200),
(18, 8, 1, 0, '2020-04-02 17:47:39', 200),
(19, 7, 1, 0, '2020-04-02 17:51:15', 201),
(20, 8, 1, 0, '2020-04-02 17:51:15', 201),
(21, 9, 1, 0, '2020-04-02 17:51:15', 201),
(22, 8, 1, 0, '2020-04-02 17:53:22', 202),
(23, 9, 1, 0, '2020-04-02 17:53:22', 202),
(24, 10, 1, 0, '2020-04-02 17:53:22', 202);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_doctor_professional_status`
--

CREATE TABLE `tbl_doctor_professional_status` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `state_id` int(11) NOT NULL DEFAULT '0',
  `type_id` tinyint(1) DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_doctor_professional_status`
--

INSERT INTO `tbl_doctor_professional_status` (`id`, `title`, `state_id`, `type_id`, `created_on`, `updated_on`, `created_by_id`) VALUES
(1, 'future', 1, 0, '2020-03-13 13:30:12', '2020-03-13 13:30:12', 1),
(2, 'current', 1, 0, '2020-03-13 13:30:17', '2020-03-13 13:30:17', 1),
(3, 'ddd', 1, 0, '2020-03-25 12:01:52', '2020-03-25 12:01:52', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_doctor_specialization`
--

CREATE TABLE `tbl_doctor_specialization` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL DEFAULT '0',
  `type_id` tinyint(1) DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_doctor_specialization`
--

INSERT INTO `tbl_doctor_specialization` (`id`, `category_id`, `state_id`, `type_id`, `created_on`, `updated_on`, `created_by_id`) VALUES
(68, 2, 0, NULL, '2020-03-24 14:44:37', '2020-03-24 14:44:37', 172),
(74, 19, 0, NULL, '2020-04-02 17:47:39', '2020-04-02 17:47:39', 200),
(75, 20, 0, NULL, '2020-04-02 17:47:39', '2020-04-02 17:47:39', 200),
(76, 19, 0, NULL, '2020-04-02 17:51:15', '2020-04-02 17:51:15', 201),
(77, 20, 0, NULL, '2020-04-02 17:51:15', '2020-04-02 17:51:15', 201),
(78, 21, 0, NULL, '2020-04-02 17:51:15', '2020-04-02 17:51:15', 201),
(79, 19, 0, NULL, '2020-04-02 17:53:22', '2020-04-02 17:53:22', 202),
(80, 20, 0, NULL, '2020-04-02 17:53:22', '2020-04-02 17:53:22', 202),
(81, 21, 0, NULL, '2020-04-02 17:53:22', '2020-04-02 17:53:22', 202);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_duration`
--

CREATE TABLE `tbl_duration` (
  `id` int(11) NOT NULL,
  `title` varchar(256) DEFAULT NULL,
  `state_id` int(11) NOT NULL DEFAULT '0',
  `type_id` tinyint(1) DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_email_queue`
--

CREATE TABLE `tbl_email_queue` (
  `id` int(11) NOT NULL,
  `from_email` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_email` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_published` datetime DEFAULT NULL,
  `last_attempt` datetime DEFAULT NULL,
  `date_sent` datetime DEFAULT NULL,
  `attempts` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `model_type` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_account_id` int(11) DEFAULT NULL,
  `message_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_email_queue`
--

INSERT INTO `tbl_email_queue` (`id`, `from_email`, `to_email`, `message`, `subject`, `date_published`, `last_attempt`, `date_sent`, `attempts`, `state_id`, `model_id`, `model_type`, `email_account_id`, `message_id`) VALUES
(1, 'admin@toxsl.in', 'newpatient@toxsl.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=UFG6qstEpeYRf381ez4Fk-rbPPzUg2EK\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=UFG6qstEpeYRf381ez4Fk-rbPPzUg2EK								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-06 11:42:15', NULL, '2020-03-06 11:42:15', NULL, 1, NULL, NULL, NULL, 'dde35b9a2de4bd56054ed0e075cb3dfb@beta.toxsl.in'),
(2, 'admin@toxsl.in', 'newpatient@toxsl.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=4mVP3Mr5gvD6jPGvSLD1IoCuZdPL39_V\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=4mVP3Mr5gvD6jPGvSLD1IoCuZdPL39_V								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-06 01:22:24', NULL, '2020-03-06 13:22:24', NULL, 1, NULL, NULL, NULL, 'dadf20f284b6bd6c54d4cdc24ec119ba@beta.toxsl.in'),
(3, 'admin@toxsl.in', 'riya@signal.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=pXwQ8XjhYj_YMUeJoc6swdhibFFmU8J5\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=pXwQ8XjhYj_YMUeJoc6swdhibFFmU8J5								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-06 05:26:38', NULL, '2020-03-06 17:26:38', NULL, 0, NULL, NULL, NULL, NULL),
(4, 'admin@toxsl.in', 'riya@signal.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=5lhtDqIwv0fPctw11Z6Z3dasDuycMmrH\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=5lhtDqIwv0fPctw11Z6Z3dasDuycMmrH								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-06 05:28:24', NULL, '2020-03-06 17:28:24', NULL, 0, NULL, NULL, NULL, NULL),
(5, 'admin@toxsl.in', 'riya@signal.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=8qoLxpvLh_N0HZODeWq_D3xw2l8EJptW\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=8qoLxpvLh_N0HZODeWq_D3xw2l8EJptW								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-06 05:30:08', NULL, '2020-03-06 17:30:08', NULL, 1, NULL, NULL, NULL, '0c88de5c118b48857d5704173fdc929e@beta.toxsl.in'),
(6, 'admin@toxsl.in', 'riya@signal.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=l-rDwbjlKwviuTg_zP1xHc2--8cw3GBy\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=l-rDwbjlKwviuTg_zP1xHc2--8cw3GBy								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-06 05:31:30', NULL, '2020-03-06 17:31:30', NULL, 1, NULL, NULL, NULL, 'e95d130bae8d3b6ffae6ae9c1273f4a2@beta.toxsl.in'),
(7, 'admin@toxsl.in', 'ri@signal.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-06 05:35:31', NULL, '2020-03-06 17:35:31', NULL, 1, NULL, NULL, NULL, 'a384cf39dde985547bfc6f88ed47e5be@beta.toxsl.in'),
(8, 'admin@toxsl.in', 'siv@o.xom', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-06 05:58:47', NULL, '2020-03-06 17:58:47', NULL, 1, NULL, NULL, NULL, 'ae64e4394c4c4e780cba45ebf120afef@beta.toxsl.in'),
(9, 'admin@toxsl.in', 'abc@signal.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-06 06:02:22', NULL, '2020-03-06 18:02:22', NULL, 1, NULL, NULL, NULL, '2992feec97781a6f7f50529c184a2b8a@beta.toxsl.in'),
(10, 'admin@toxsl.in', 'a@signal.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-06 06:05:59', NULL, '2020-03-06 18:05:59', NULL, 1, NULL, NULL, NULL, '1ffcf227bb09baa3bf91d87064e60157@beta.toxsl.in'),
(11, 'admin@toxsl.in', 'riya@signal.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-06 06:09:56', NULL, '2020-03-06 18:09:56', NULL, 1, NULL, NULL, NULL, 'e0d55fbb87dd01702a4c022375d16271@beta.toxsl.in'),
(12, 'admin@toxsl.in', 'ashish@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-06 06:55:48', NULL, '2020-03-06 18:55:48', NULL, 1, NULL, NULL, NULL, '079d0e262f89bf7e11620d8e488da4b9@beta.toxsl.in'),
(13, 'admin@toxsl.in', 'ashish@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-06 07:00:41', NULL, '2020-03-06 19:00:41', NULL, 1, NULL, NULL, NULL, 'd42a51b5547f0249fcd73ffcbbc2c771@beta.toxsl.in'),
(14, 'admin@toxsl.in', 'ashish@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-06 07:09:06', NULL, '2020-03-06 19:09:06', NULL, 1, NULL, NULL, NULL, '164b595a65a8bbf25350fa3288a5cb34@beta.toxsl.in'),
(15, 'admin@toxsl.in', 'viren@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-06 07:11:42', NULL, '2020-03-06 19:11:42', NULL, 1, NULL, NULL, NULL, '8f907688221e7e120fbdb53226ae1733@beta.toxsl.in'),
(16, 'admin@toxsl.in', 'riy@signal.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-06 07:15:51', NULL, '2020-03-06 19:15:51', NULL, 1, NULL, NULL, NULL, '0f303ddd3007c5ac5d308c2078fdcfab@beta.toxsl.in');
INSERT INTO `tbl_email_queue` (`id`, `from_email`, `to_email`, `message`, `subject`, `date_published`, `last_attempt`, `date_sent`, `attempts`, `state_id`, `model_id`, `model_type`, `email_account_id`, `message_id`) VALUES
(17, 'admin@toxsl.in', 'ashish@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-06 07:18:02', NULL, '2020-03-06 19:18:02', NULL, 1, NULL, NULL, NULL, '20cc8fa347093dc243ce65c5b09034b3@beta.toxsl.in'),
(18, 'admin@toxsl.in', 'ri@signal.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-06 07:23:29', NULL, '2020-03-06 19:23:29', NULL, 1, NULL, NULL, NULL, '3e318393369ddda265f1118015fee4d2@beta.toxsl.in'),
(19, 'admin@toxsl.in', 'ri@signal.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-06 07:25:02', NULL, '2020-03-06 19:25:03', NULL, 1, NULL, NULL, NULL, '9bdfdf35163904bcd105a99b3799fa7a@beta.toxsl.in'),
(20, 'admin@toxsl.in', 'r@signal.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-06 08:33:14', NULL, '2020-03-06 20:33:14', NULL, 0, NULL, NULL, NULL, NULL),
(21, 'admin@toxsl.in', 'riya@signal.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-06 08:43:15', NULL, '2020-03-06 20:43:15', NULL, 0, NULL, NULL, NULL, NULL),
(22, 'admin@toxsl.in', 'ashish@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-06 09:34:00', NULL, '2020-03-06 21:34:00', NULL, 0, NULL, NULL, NULL, NULL),
(23, 'admin@toxsl.in', 'ashish@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-06 09:35:07', NULL, '2020-03-06 21:35:07', NULL, 0, NULL, NULL, NULL, NULL),
(24, 'admin@toxsl.in', 'ashish@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-06 09:36:54', NULL, '2020-03-06 21:36:54', NULL, 0, NULL, NULL, NULL, NULL),
(25, 'admin@toxsl.in', 'viren@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-06 09:39:20', NULL, '2020-03-06 21:39:20', NULL, 0, NULL, NULL, NULL, NULL),
(26, 'admin@toxsl.in', 'patient@toxsl.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-06 09:48:25', NULL, '2020-03-06 21:48:25', NULL, 0, NULL, NULL, NULL, NULL),
(27, 'admin@toxsl.in', 'ashish@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-06 09:50:06', NULL, '2020-03-06 21:50:06', NULL, 0, NULL, NULL, NULL, NULL),
(28, 'admin@toxsl.in', 'websitetest54@gmail.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-06 09:55:00', NULL, '2020-03-06 21:55:00', NULL, 0, NULL, NULL, NULL, NULL),
(29, 'admin@toxsl.in', 'patient@toxsl.in1', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-06 09:59:14', NULL, '2020-03-06 21:59:14', NULL, 0, NULL, NULL, NULL, NULL),
(30, 'admin@toxsl.in', 'patient@toxsl.in11', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-06 10:00:19', NULL, '2020-03-06 22:00:19', NULL, 0, NULL, NULL, NULL, NULL),
(31, 'admin@toxsl.in', 'b@signal.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-06 10:01:47', NULL, '2020-03-06 22:01:47', NULL, 0, NULL, NULL, NULL, NULL),
(32, 'admin@toxsl.in', 'ashish@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-06 10:03:54', NULL, '2020-03-06 22:03:54', NULL, 0, NULL, NULL, NULL, NULL),
(33, 'admin@toxsl.in', 'patient710@toxsl.in22233152', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-07 10:41:15', NULL, '2020-03-07 10:41:15', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_email_queue` (`id`, `from_email`, `to_email`, `message`, `subject`, `date_published`, `last_attempt`, `date_sent`, `attempts`, `state_id`, `model_id`, `model_type`, `email_account_id`, `message_id`) VALUES
(34, 'admin@toxsl.in', 'patientss@toxsl.in22233152', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-07 10:41:40', NULL, '2020-03-07 10:41:40', NULL, 0, NULL, NULL, NULL, NULL),
(35, 'admin@toxsl.in', 'riya@signal.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-07 12:58:18', NULL, '2020-03-07 12:58:18', NULL, 0, NULL, NULL, NULL, NULL),
(36, 'admin@toxsl.in', 'ashish@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-07 03:42:12', NULL, '2020-03-07 15:42:12', NULL, 0, NULL, NULL, NULL, NULL),
(37, 'admin@toxsl.in', 'test@t.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-07 03:48:22', NULL, '2020-03-07 15:48:22', NULL, 0, NULL, NULL, NULL, NULL),
(38, 'admin@toxsl.in', 'ashish@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-07 04:47:09', NULL, '2020-03-07 16:47:09', NULL, 0, NULL, NULL, NULL, NULL),
(39, 'admin@toxsl.in', 'hh@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-07 05:14:48', NULL, '2020-03-07 17:14:48', NULL, 0, NULL, NULL, NULL, NULL),
(40, 'admin@toxsl.in', 'hddh@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-07 05:18:08', NULL, '2020-03-07 17:18:08', NULL, 0, NULL, NULL, NULL, NULL),
(41, 'admin@toxsl.in', 'p@signal.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-07 05:23:40', NULL, '2020-03-07 17:23:40', NULL, 0, NULL, NULL, NULL, NULL),
(42, 'admin@toxsl.in', 'pass@signal.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-07 05:27:17', NULL, '2020-03-07 17:27:17', NULL, 0, NULL, NULL, NULL, NULL),
(43, 'admin@toxsl.in', 'hhh@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-07 05:38:28', NULL, '2020-03-07 17:38:28', NULL, 0, NULL, NULL, NULL, NULL),
(44, 'admin@toxsl.in', 'hdhd@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-07 05:53:41', NULL, '2020-03-07 17:53:41', NULL, 0, NULL, NULL, NULL, NULL),
(45, 'admin@toxsl.in', 'sahil@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-07 05:57:39', NULL, '2020-03-07 17:57:39', NULL, 0, NULL, NULL, NULL, NULL),
(46, 'admin@toxsl.in', 'ashish@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-07 06:02:23', NULL, '2020-03-07 18:02:23', NULL, 0, NULL, NULL, NULL, NULL),
(47, 'admin@toxsl.in', 'osae07@gmail.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-07 06:15:50', NULL, '2020-03-07 18:15:50', NULL, 0, NULL, NULL, NULL, NULL),
(48, 'admin@toxsl.in', 'James.Abechi@signaladoc.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-07 06:30:23', NULL, '2020-03-07 18:30:23', NULL, 0, NULL, NULL, NULL, NULL),
(49, 'admin@toxsl.in', 'pass@signal.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-07 06:39:42', NULL, '2020-03-07 18:39:42', NULL, 0, NULL, NULL, NULL, NULL),
(50, 'admin@toxsl.in', 'ceoinstinct@gmail.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-07 07:43:57', NULL, '2020-03-07 19:43:57', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_email_queue` (`id`, `from_email`, `to_email`, `message`, `subject`, `date_published`, `last_attempt`, `date_sent`, `attempts`, `state_id`, `model_id`, `model_type`, `email_account_id`, `message_id`) VALUES
(51, 'admin@toxsl.in', 'riya@signal.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-12 10:46:39', NULL, '2020-03-12 10:46:39', NULL, 0, NULL, NULL, NULL, NULL),
(52, 'admin@toxsl.in', 'riya@signal.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-12 12:47:38', NULL, '2020-03-12 12:47:38', NULL, 0, NULL, NULL, NULL, NULL),
(53, 'admin@toxsl.in', 'ashish@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-12 02:40:14', NULL, '2020-03-12 14:40:14', NULL, 0, NULL, NULL, NULL, NULL),
(54, 'admin@toxsl.in', 'ri@signal.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-12 03:43:14', NULL, '2020-03-12 15:43:14', NULL, 0, NULL, NULL, NULL, NULL),
(55, 'admin@toxsl.in', 'viren@gmail.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-12 04:56:44', NULL, '2020-03-12 16:56:44', NULL, 0, NULL, NULL, NULL, NULL),
(56, 'admin@toxsl.in', 'ashish@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-12 05:16:44', NULL, '2020-03-12 17:16:44', NULL, 0, NULL, NULL, NULL, NULL),
(57, 'admin@toxsl.in', 'riya@signal.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-12 05:27:25', NULL, '2020-03-12 17:27:25', NULL, 0, NULL, NULL, NULL, NULL),
(58, 'admin@toxsl.in', 'riya@signal.uu', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-12 05:30:25', NULL, '2020-03-12 17:30:25', NULL, 0, NULL, NULL, NULL, NULL),
(59, 'admin@toxsl.in', 'riya@vsignal.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-12 05:35:21', NULL, '2020-03-12 17:35:21', NULL, 0, NULL, NULL, NULL, NULL),
(60, 'admin@toxsl.in', 'riyad@signal.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-12 05:37:43', NULL, '2020-03-12 17:37:43', NULL, 0, NULL, NULL, NULL, NULL),
(61, 'admin@toxsl.in', 'ashish@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-12 05:43:53', NULL, '2020-03-12 17:43:53', NULL, 0, NULL, NULL, NULL, NULL),
(62, 'admin@toxsl.in', 'gh@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-12 05:44:42', NULL, '2020-03-12 17:44:42', NULL, 0, NULL, NULL, NULL, NULL),
(63, 'admin@toxsl.in', 'ashish@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-12 05:46:09', NULL, '2020-03-12 17:46:09', NULL, 0, NULL, NULL, NULL, NULL),
(64, 'admin@toxsl.in', 'ashish@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-12 06:35:36', NULL, '2020-03-12 18:35:36', NULL, 0, NULL, NULL, NULL, NULL),
(65, 'admin@toxsl.in', 'riya@signal.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-12 07:32:25', NULL, '2020-03-12 19:32:25', NULL, 0, NULL, NULL, NULL, NULL),
(66, 'admin@toxsl.in', 'abechij@gmail.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-12 09:28:51', NULL, '2020-03-12 21:28:51', NULL, 0, NULL, NULL, NULL, NULL),
(67, 'admin@toxsl.in', 'ceoinstinct@gmail.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-12 10:23:05', NULL, '2020-03-12 22:23:05', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_email_queue` (`id`, `from_email`, `to_email`, `message`, `subject`, `date_published`, `last_attempt`, `date_sent`, `attempts`, `state_id`, `model_id`, `model_type`, `email_account_id`, `message_id`) VALUES
(68, 'admin@toxsl.in', 'osae07@gmail.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-12 11:17:12', NULL, '2020-03-12 23:17:12', NULL, 0, NULL, NULL, NULL, NULL),
(69, 'admin@toxsl.in', 'Osae07@yahoo.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-12 11:45:24', NULL, '2020-03-12 23:45:24', NULL, 0, NULL, NULL, NULL, NULL),
(70, 'admin@toxsl.in', 'priyanka@doc.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=HUblMYFgD_Gpg6Bqoq8gZl9cCWnJT-6K_1584087563\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=HUblMYFgD_Gpg6Bqoq8gZl9cCWnJT-6K_1584087563								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-13 01:49:23', NULL, '2020-03-13 13:49:23', NULL, 0, NULL, NULL, NULL, NULL),
(71, 'admin@toxsl.in', 'newpatient@toxsl.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-13 03:06:04', NULL, '2020-03-13 15:06:04', NULL, 0, NULL, NULL, NULL, NULL),
(72, 'admin@toxsl.in', 'ashish.kumar@toxsltech.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=IlTWQXWeASEZqHRmHamETHp_kkCl4hiU_1584101806\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=IlTWQXWeASEZqHRmHamETHp_kkCl4hiU_1584101806								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-13 05:46:46', NULL, '2020-03-13 17:46:46', NULL, 0, NULL, NULL, NULL, NULL),
(73, 'admin@toxsl.in', 'riya@signal.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-14 09:44:37', NULL, '2020-03-14 09:44:37', NULL, 0, NULL, NULL, NULL, NULL),
(74, 'admin@toxsl.in', 'shubham@signal.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-14 03:23:28', NULL, '2020-03-14 15:23:28', NULL, 0, NULL, NULL, NULL, NULL),
(75, 'admin@toxsl.in', 'riya@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-16 10:15:40', NULL, '2020-03-16 10:15:40', NULL, 0, NULL, NULL, NULL, NULL),
(76, 'admin@toxsl.in', 'riya@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-17 09:18:58', NULL, '2020-03-17 09:18:58', NULL, 0, NULL, NULL, NULL, NULL),
(77, 'admin@toxsl.in', 'riya@signal.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-17 09:52:56', NULL, '2020-03-17 09:52:56', NULL, 0, NULL, NULL, NULL, NULL),
(78, 'admin@toxsl.in', 'doctor@toxsl.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-17 10:02:11', NULL, '2020-03-17 10:02:11', NULL, 0, NULL, NULL, NULL, NULL),
(79, 'admin@toxsl.in', 'riya@signal.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-17 10:42:14', NULL, '2020-03-17 10:42:14', NULL, 0, NULL, NULL, NULL, NULL),
(80, 'admin@toxsl.in', 'ashish@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-17 01:26:44', NULL, '2020-03-17 13:26:44', NULL, 0, NULL, NULL, NULL, NULL),
(81, 'admin@toxsl.in', 'viren@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-17 03:20:15', NULL, '2020-03-17 15:20:15', NULL, 0, NULL, NULL, NULL, NULL),
(82, 'admin@toxsl.in', 'riya@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-17 03:34:19', NULL, '2020-03-17 15:34:19', NULL, 0, NULL, NULL, NULL, NULL),
(83, 'admin@toxsl.in', 'ashish@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-17 03:37:45', NULL, '2020-03-17 15:37:45', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_email_queue` (`id`, `from_email`, `to_email`, `message`, `subject`, `date_published`, `last_attempt`, `date_sent`, `attempts`, `state_id`, `model_id`, `model_type`, `email_account_id`, `message_id`) VALUES
(84, 'admin@toxsl.in', 'test@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-17 03:48:19', NULL, '2020-03-17 15:48:19', NULL, 0, NULL, NULL, NULL, NULL),
(85, 'admin@toxsl.in', 'riya@signal.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-17 05:47:51', NULL, '2020-03-17 17:47:51', NULL, 0, NULL, NULL, NULL, NULL),
(86, 'admin@toxsl.in', 'riya123@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-17 05:48:30', NULL, '2020-03-17 17:48:30', NULL, 0, NULL, NULL, NULL, NULL),
(87, 'admin@toxsl.in', 'riya12345@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-17 06:01:15', NULL, '2020-03-17 18:01:15', NULL, 0, NULL, NULL, NULL, NULL),
(88, 'admin@toxsl.in', 'riya@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-17 06:15:01', NULL, '2020-03-17 18:15:01', NULL, 0, NULL, NULL, NULL, NULL),
(89, 'admin@toxsl.in', 'ashish@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-17 06:38:19', NULL, '2020-03-17 18:38:19', NULL, 0, NULL, NULL, NULL, NULL),
(90, 'admin@toxsl.in', 'riya@signal.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-17 06:40:52', NULL, '2020-03-17 18:40:52', NULL, 0, NULL, NULL, NULL, NULL),
(91, 'admin@toxsl.in', 'tt@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-17 07:01:09', NULL, '2020-03-17 19:01:09', NULL, 0, NULL, NULL, NULL, NULL),
(92, 'admin@toxsl.in', 'viren@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-17 07:03:28', NULL, '2020-03-17 19:03:28', NULL, 0, NULL, NULL, NULL, NULL),
(93, 'admin@toxsl.in', 'viren@t.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-17 07:10:32', NULL, '2020-03-17 19:10:32', NULL, 0, NULL, NULL, NULL, NULL),
(94, 'admin@toxsl.in', 'ashish@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-17 07:15:30', NULL, '2020-03-17 19:15:30', NULL, 0, NULL, NULL, NULL, NULL),
(95, 'admin@toxsl.in', 'ashish@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-17 07:37:23', NULL, '2020-03-17 19:37:23', NULL, 0, NULL, NULL, NULL, NULL),
(96, 'admin@toxsl.in', 'viren@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-17 07:40:02', NULL, '2020-03-17 19:40:02', NULL, 0, NULL, NULL, NULL, NULL),
(97, 'admin@toxsl.in', 'ashish@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-17 07:48:34', NULL, '2020-03-17 19:48:34', NULL, 0, NULL, NULL, NULL, NULL),
(98, 'admin@toxsl.in', 'viren@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-17 08:03:49', NULL, '2020-03-17 20:03:49', NULL, 0, NULL, NULL, NULL, NULL),
(99, 'admin@toxsl.in', 'ceoinstinct@gmail.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-17 08:42:21', NULL, '2020-03-17 20:42:21', NULL, 0, NULL, NULL, NULL, NULL),
(100, 'admin@toxsl.in', 'osae07@gmail.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-17 10:03:56', NULL, '2020-03-17 22:03:56', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_email_queue` (`id`, `from_email`, `to_email`, `message`, `subject`, `date_published`, `last_attempt`, `date_sent`, `attempts`, `state_id`, `model_id`, `model_type`, `email_account_id`, `message_id`) VALUES
(101, 'admin@toxsl.in', 'osae07@yahoo.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-17 10:22:39', NULL, '2020-03-17 22:22:39', NULL, 0, NULL, NULL, NULL, NULL),
(102, 'admin@toxsl.in', 'James.Abechi@signaladoc.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-17 11:43:51', NULL, '2020-03-17 23:43:51', NULL, 0, NULL, NULL, NULL, NULL),
(103, 'admin@toxsl.in', 'viren@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-18 12:51:45', NULL, '2020-03-18 12:51:45', NULL, 0, NULL, NULL, NULL, NULL),
(104, 'admin@toxsl.in', 'riy@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-18 12:52:21', NULL, '2020-03-18 12:52:21', NULL, 0, NULL, NULL, NULL, NULL),
(105, 'admin@toxsl.in', 'test@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-18 12:57:01', NULL, '2020-03-18 12:57:01', NULL, 0, NULL, NULL, NULL, NULL),
(106, 'admin@toxsl.in', 'jj@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-18 12:58:35', NULL, '2020-03-18 12:58:35', NULL, 0, NULL, NULL, NULL, NULL),
(107, 'admin@toxsl.in', 'test@t.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-18 01:03:02', NULL, '2020-03-18 13:03:02', NULL, 0, NULL, NULL, NULL, NULL),
(108, 'admin@toxsl.in', 'doctor0710@toxsl.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-18 01:39:59', NULL, '2020-03-18 13:39:59', NULL, 0, NULL, NULL, NULL, NULL),
(109, 'admin@toxsl.in', 'ri@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-18 01:40:30', NULL, '2020-03-18 13:40:30', NULL, 0, NULL, NULL, NULL, NULL),
(110, 'admin@toxsl.in', 'Osae07@hotmail.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-18 05:39:23', NULL, '2020-03-18 17:39:23', NULL, 0, NULL, NULL, NULL, NULL),
(111, 'admin@toxsl.in', 'abechij@gmail.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-18 05:45:26', NULL, '2020-03-18 17:45:26', NULL, 0, NULL, NULL, NULL, NULL),
(112, 'admin@toxsl.in', 'testDoctor@toxsl.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-18 06:14:32', NULL, '2020-03-18 18:14:32', NULL, 0, NULL, NULL, NULL, NULL),
(113, 'admin@toxsl.in', 'riya@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-24 10:40:57', NULL, '2020-03-24 10:40:57', NULL, 0, NULL, NULL, NULL, NULL),
(114, 'admin@toxsl.in', 'riya@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-24 10:51:39', NULL, '2020-03-24 10:51:39', NULL, 0, NULL, NULL, NULL, NULL),
(115, 'admin@toxsl.in', 'riya@signal.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-24 11:06:28', NULL, '2020-03-24 11:06:28', NULL, 0, NULL, NULL, NULL, NULL),
(116, 'admin@toxsl.in', 'Trandddd331est@207String.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-24 02:44:37', NULL, '2020-03-24 14:44:37', NULL, 0, NULL, NULL, NULL, NULL),
(117, 'admin@toxsl.in', 'riya@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-24 03:28:59', NULL, '2020-03-24 15:28:59', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_email_queue` (`id`, `from_email`, `to_email`, `message`, `subject`, `date_published`, `last_attempt`, `date_sent`, `attempts`, `state_id`, `model_id`, `model_type`, `email_account_id`, `message_id`) VALUES
(118, 'admin@toxsl.in', 'riy@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-24 03:34:19', NULL, '2020-03-24 15:34:19', NULL, 0, NULL, NULL, NULL, NULL),
(119, 'admin@toxsl.in', 'janedoe@gmail.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-24 05:38:15', NULL, '2020-03-24 17:38:15', NULL, 0, NULL, NULL, NULL, NULL),
(120, 'admin@toxsl.in', 'kenechiibeanu@gmail.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-24 11:48:32', NULL, '2020-03-24 23:48:32', NULL, 0, NULL, NULL, NULL, NULL),
(121, 'admin@toxsl.in', 'riya@signal.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-25 09:33:16', NULL, '2020-03-25 09:33:16', NULL, 0, NULL, NULL, NULL, NULL),
(122, 'admin@toxsl.in', 'riya@doctor.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-25 03:34:23', NULL, '2020-03-25 15:34:23', NULL, 0, NULL, NULL, NULL, NULL),
(123, 'admin@toxsl.in', 'pass@signal.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-25 03:47:41', NULL, '2020-03-25 15:47:41', NULL, 0, NULL, NULL, NULL, NULL),
(124, 'admin@toxsl.in', 'ram@g.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-25 04:41:44', NULL, '2020-03-25 16:41:44', NULL, 0, NULL, NULL, NULL, NULL),
(125, 'admin@toxsl.in', 'rama@g.in', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-25 04:51:10', NULL, '2020-03-25 16:51:10', NULL, 0, NULL, NULL, NULL, NULL),
(126, 'admin@toxsl.in', 't@gmail.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-25 07:02:05', NULL, '2020-03-25 19:02:05', NULL, 0, NULL, NULL, NULL, NULL),
(127, 'admin@toxsl.in', 'edward767@gmail.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-25 08:04:53', NULL, '2020-03-25 20:04:53', NULL, 0, NULL, NULL, NULL, NULL),
(128, 'admin@toxsl.in', 'riya@signal.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-26 10:35:32', NULL, '2020-03-26 10:35:32', NULL, 0, NULL, NULL, NULL, NULL),
(129, 'admin@toxsl.in', 'riya@doctor.co', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-26 01:24:17', NULL, '2020-03-26 13:24:17', NULL, 0, NULL, NULL, NULL, NULL),
(130, 'admin@toxsl.in', 'admindoctor@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-26 03:17:37', NULL, '2020-03-26 15:17:37', NULL, 0, NULL, NULL, NULL, NULL),
(131, 'admin@toxsl.in', 'adminpatient@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-26 03:25:47', NULL, '2020-03-26 15:25:47', NULL, 0, NULL, NULL, NULL, NULL),
(132, 'admin@toxsl.in', 'sony@gmail.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-26 09:28:24', NULL, '2020-03-26 21:28:24', NULL, 0, NULL, NULL, NULL, NULL),
(133, 'admin@toxsl.in', 'trump@gmail.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-26 09:38:58', NULL, '2020-03-26 21:38:58', NULL, 0, NULL, NULL, NULL, NULL),
(134, 'admin@toxsl.in', 'liz@gmail.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-26 09:50:09', NULL, '2020-03-26 21:50:09', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_email_queue` (`id`, `from_email`, `to_email`, `message`, `subject`, `date_published`, `last_attempt`, `date_sent`, `attempts`, `state_id`, `model_id`, `model_type`, `email_account_id`, `message_id`) VALUES
(135, 'admin@toxsl.in', 'pass101@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-27 04:10:44', NULL, '2020-03-27 16:10:44', NULL, 0, NULL, NULL, NULL, NULL),
(136, 'admin@toxsl.in', 'Trand36ddd7est@459String.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-27 04:23:12', NULL, '2020-03-27 16:23:12', NULL, 0, NULL, NULL, NULL, NULL),
(137, 'admin@toxsl.in', 'pass1014@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-27 04:36:29', NULL, '2020-03-27 16:36:29', NULL, 0, NULL, NULL, NULL, NULL),
(138, 'admin@toxsl.in', 'pass102@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-27 04:43:38', NULL, '2020-03-27 16:43:38', NULL, 0, NULL, NULL, NULL, NULL),
(139, 'admin@toxsl.in', 'passdoc@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-30 02:48:04', NULL, '2020-03-30 14:48:04', NULL, 0, NULL, NULL, NULL, NULL),
(140, 'admin@toxsl.in', 'passDoc@signal.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-31 04:56:37', NULL, '2020-03-31 16:56:37', NULL, 0, NULL, NULL, NULL, NULL),
(141, 'admin@toxsl.in', 'toun_99@gmail.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-31 08:23:38', NULL, '2020-03-31 20:23:38', NULL, 0, NULL, NULL, NULL, NULL),
(142, 'admin@toxsl.in', 'toun99@gmail.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email?id=								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-03-31 08:37:46', NULL, '2020-03-31 20:37:46', NULL, 0, NULL, NULL, NULL, NULL),
(143, 'admin@toxsl.in', 'passdoc@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td align=\"left\"\n		style=\"font-family: Lato, sans-serif; padding-top: 30px; padding-bottom: 0; color: #333333;\"><h3\n			style=\"margin: 0; font-weight: 500; font-size: 19px;\">Hi Pass Singh,</h3></td>\n</tr>\n\n<tr>\n\n	<td align=\"left\">\n		<p\n			style=\"font-size: 14px; padding: 0 0px 23px; border-bottom: 1px solid #ececec; text-align: left; color: #666; margin-bottom: 8px;\">New Appointment has been booked by Pass Singh. You can seen the user details below :</p>\n\n		<p\n			style=\"font-size: 14px; padding: 0 0px 23px; border-bottom: 1px solid #ececec; text-align: left; color: #666; margin-bottom: 8px;\">\n			\n			Username:Pass Singh</br> </br>\n			User Email:pass@signal.com</br> </br>\n		</p>\n\n\n	</td>\n</tr>\n\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Appointment Alert', '2020-04-01 02:56:41', NULL, '2020-04-01 14:56:41', NULL, 0, NULL, NULL, NULL, NULL),
(144, 'admin@toxsl.in', 'passdoc@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td align=\"left\"\n		style=\"font-family: Lato, sans-serif; padding-top: 30px; padding-bottom: 0; color: #333333;\"><h3\n			style=\"margin: 0; font-weight: 500; font-size: 19px;\">Hi Pass Singh,</h3></td>\n</tr>\n\n<tr>\n\n	<td align=\"left\">\n		<p\n			style=\"font-size: 14px; padding: 0 0px 23px; border-bottom: 1px solid #ececec; text-align: left; color: #666; margin-bottom: 8px;\">New Appointment has been booked by Pass Singh. You can seen the user details below :</p>\n\n		<p\n			style=\"font-size: 14px; padding: 0 0px 23px; border-bottom: 1px solid #ececec; text-align: left; color: #666; margin-bottom: 8px;\">\n			\n			Username:Pass Singh</br> </br>\n			User Email:pass@signal.com</br> </br>\n		</p>\n\n\n	</td>\n</tr>\n\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Appointment Alert', '2020-04-01 02:57:07', NULL, '2020-04-01 14:57:07', NULL, 0, NULL, NULL, NULL, NULL),
(145, 'admin@toxsl.in', 'passdoc@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td align=\"left\"\n		style=\"font-family: Lato, sans-serif; padding-top: 30px; padding-bottom: 0; color: #333333;\"><h3\n			style=\"margin: 0; font-weight: 500; font-size: 19px;\">Hi Pass Singh,</h3></td>\n</tr>\n\n<tr>\n\n	<td align=\"left\">\n		<p\n			style=\"font-size: 14px; padding: 0 0px 23px; border-bottom: 1px solid #ececec; text-align: left; color: #666; margin-bottom: 8px;\">New Appointment has been booked by Pass Singh. You can seen the user details below :</p>\n\n		<p\n			style=\"font-size: 14px; padding: 0 0px 23px; border-bottom: 1px solid #ececec; text-align: left; color: #666; margin-bottom: 8px;\">\n			\n			Username:Pass Singh</br> </br>\n			User Email:pass@signal.com</br> </br>\n		</p>\n\n\n	</td>\n</tr>\n\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Appointment Alert', '2020-04-01 02:57:32', NULL, '2020-04-01 14:57:32', NULL, 0, NULL, NULL, NULL, NULL),
(146, 'admin@toxsl.in', 'passdoc@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td align=\"left\"\n		style=\"font-family: Lato, sans-serif; padding-top: 30px; padding-bottom: 0; color: #333333;\"><h3\n			style=\"margin: 0; font-weight: 500; font-size: 19px;\">Hi Pass Singh,</h3></td>\n</tr>\n\n<tr>\n\n	<td align=\"left\">\n		<p\n			style=\"font-size: 14px; padding: 0 0px 23px; border-bottom: 1px solid #ececec; text-align: left; color: #666; margin-bottom: 8px;\">New Appointment has been booked by Pass Singh. You can seen the user details below :</p>\n\n		<p\n			style=\"font-size: 14px; padding: 0 0px 23px; border-bottom: 1px solid #ececec; text-align: left; color: #666; margin-bottom: 8px;\">\n			\n			Username:Pass Singh</br> </br>\n			User Email:pass@signal.com</br> </br>\n		</p>\n\n\n	</td>\n</tr>\n\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Appointment Alert', '2020-04-01 02:57:36', NULL, '2020-04-01 14:57:36', NULL, 0, NULL, NULL, NULL, NULL),
(147, 'admin@toxsl.in', 'passdoc@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td align=\"left\"\n		style=\"font-family: Lato, sans-serif; padding-top: 30px; padding-bottom: 0; color: #333333;\"><h3\n			style=\"margin: 0; font-weight: 500; font-size: 19px;\">Hi Pass Singh,</h3></td>\n</tr>\n\n<tr>\n\n	<td align=\"left\">\n		<p\n			style=\"font-size: 14px; padding: 0 0px 23px; border-bottom: 1px solid #ececec; text-align: left; color: #666; margin-bottom: 8px;\">New Appointment has been booked by Pass Singh. You can seen the user details below :</p>\n\n		<p\n			style=\"font-size: 14px; padding: 0 0px 23px; border-bottom: 1px solid #ececec; text-align: left; color: #666; margin-bottom: 8px;\">\n			\n			Username:Pass Singh</br> </br>\n			User Email:pass@signal.com</br> </br>\n		</p>\n\n\n	</td>\n</tr>\n\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Appointment Alert', '2020-04-01 03:28:07', NULL, '2020-04-01 15:28:07', NULL, 0, NULL, NULL, NULL, NULL),
(148, 'admin@toxsl.in', 'passdoc@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td align=\"left\"\n		style=\"font-family: Lato, sans-serif; padding-top: 30px; padding-bottom: 0; color: #333333;\"><h3\n			style=\"margin: 0; font-weight: 500; font-size: 19px;\">Hi Pass Singh,</h3></td>\n</tr>\n\n<tr>\n\n	<td align=\"left\">\n		<p\n			style=\"font-size: 14px; padding: 0 0px 23px; border-bottom: 1px solid #ececec; text-align: left; color: #666; margin-bottom: 8px;\">New Appointment has been booked by Pass Singh. You can seen the user details below :</p>\n\n		<p\n			style=\"font-size: 14px; padding: 0 0px 23px; border-bottom: 1px solid #ececec; text-align: left; color: #666; margin-bottom: 8px;\">\n			\n			Username:Pass Singh</br> </br>\n			User Email:pass@signal.com</br> </br>\n		</p>\n\n\n	</td>\n</tr>\n\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Appointment Alert', '2020-04-01 03:42:55', NULL, '2020-04-01 15:42:55', NULL, 0, NULL, NULL, NULL, NULL),
(149, 'admin@toxsl.in', 'passdoc@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td align=\"left\"\n		style=\"font-family: Lato, sans-serif; padding-top: 30px; padding-bottom: 0; color: #333333;\"><h3\n			style=\"margin: 0; font-weight: 500; font-size: 19px;\">Hi Pass Singh,</h3></td>\n</tr>\n\n<tr>\n\n	<td align=\"left\">\n		<p\n			style=\"font-size: 14px; padding: 0 0px 23px; border-bottom: 1px solid #ececec; text-align: left; color: #666; margin-bottom: 8px;\">New Appointment has been booked by Pass Singh. You can seen the user details below :</p>\n\n		<p\n			style=\"font-size: 14px; padding: 0 0px 23px; border-bottom: 1px solid #ececec; text-align: left; color: #666; margin-bottom: 8px;\">\n			\n			Username:Pass Singh</br> </br>\n			User Email:pass@signal.com</br> </br>\n		</p>\n\n\n	</td>\n</tr>\n\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Appointment Alert', '2020-04-01 03:43:34', NULL, '2020-04-01 15:43:34', NULL, 0, NULL, NULL, NULL, NULL),
(150, 'admin@toxsl.in', 'passdoc@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td align=\"left\"\n		style=\"font-family: Lato, sans-serif; padding-top: 30px; padding-bottom: 0; color: #333333;\"><h3\n			style=\"margin: 0; font-weight: 500; font-size: 19px;\">Hi Pass Singh,</h3></td>\n</tr>\n\n<tr>\n\n	<td align=\"left\">\n		<p\n			style=\"font-size: 14px; padding: 0 0px 23px; border-bottom: 1px solid #ececec; text-align: left; color: #666; margin-bottom: 8px;\">New Appointment has been booked by Riya Mahajan. You can seen the user details below :</p>\n\n		<p\n			style=\"font-size: 14px; padding: 0 0px 23px; border-bottom: 1px solid #ececec; text-align: left; color: #666; margin-bottom: 8px;\">\n			\n			Username:Riya Mahajan</br> </br>\n			User Email:riya@signal.com</br> </br>\n		</p>\n\n\n	</td>\n</tr>\n\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Appointment Alert', '2020-04-02 10:36:40', NULL, '2020-04-02 10:36:40', NULL, 0, NULL, NULL, NULL, NULL),
(151, 'admin@toxsl.in', 'passdoc@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td align=\"left\"\n		style=\"font-family: Lato, sans-serif; padding-top: 30px; padding-bottom: 0; color: #333333;\"><h3\n			style=\"margin: 0; font-weight: 500; font-size: 19px;\">Hi Pass Singh,</h3></td>\n</tr>\n\n<tr>\n\n	<td align=\"left\">\n		<p\n			style=\"font-size: 14px; padding: 0 0px 23px; border-bottom: 1px solid #ececec; text-align: left; color: #666; margin-bottom: 8px;\">New Appointment has been booked by Pass Singh. You can seen the user details below :</p>\n\n		<p\n			style=\"font-size: 14px; padding: 0 0px 23px; border-bottom: 1px solid #ececec; text-align: left; color: #666; margin-bottom: 8px;\">\n			\n			Username:Pass Singh</br> </br>\n			User Email:pass@signal.com</br> </br>\n		</p>\n\n\n	</td>\n</tr>\n\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Appointment Alert', '2020-04-02 04:25:08', NULL, '2020-04-02 16:25:08', NULL, 0, NULL, NULL, NULL, NULL),
(152, 'admin@toxsl.in', 'passdoc@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td align=\"left\"\n		style=\"font-family: Lato, sans-serif; padding-top: 30px; padding-bottom: 0; color: #333333;\"><h3\n			style=\"margin: 0; font-weight: 500; font-size: 19px;\">Hi Pass Singh,</h3></td>\n</tr>\n\n<tr>\n\n	<td align=\"left\">\n		<p\n			style=\"font-size: 14px; padding: 0 0px 23px; border-bottom: 1px solid #ececec; text-align: left; color: #666; margin-bottom: 8px;\">New Appointment has been booked by Pass Singh. You can seen the user details below :</p>\n\n		<p\n			style=\"font-size: 14px; padding: 0 0px 23px; border-bottom: 1px solid #ececec; text-align: left; color: #666; margin-bottom: 8px;\">\n			\n			Username:Pass Singh</br> </br>\n			User Email:pass@signal.com</br> </br>\n		</p>\n\n\n	</td>\n</tr>\n\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Appointment Alert', '2020-04-02 04:28:41', NULL, '2020-04-02 16:28:41', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_email_queue` (`id`, `from_email`, `to_email`, `message`, `subject`, `date_published`, `last_attempt`, `date_sent`, `attempts`, `state_id`, `model_id`, `model_type`, `email_account_id`, `message_id`) VALUES
(153, 'admin@toxsl.in', 'pass@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-04-02 04:50:16', NULL, '2020-04-02 16:50:16', NULL, 0, NULL, NULL, NULL, NULL),
(154, 'admin@toxsl.in', 'pass@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-04-02 05:47:39', NULL, '2020-04-02 17:47:39', NULL, 0, NULL, NULL, NULL, NULL),
(155, 'admin@toxsl.in', 'riya@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-04-02 05:51:15', NULL, '2020-04-02 17:51:15', NULL, 0, NULL, NULL, NULL, NULL),
(156, 'admin@toxsl.in', 'passdoc@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td colspan=\"2\" style=\"padding: 30px 0;\">\n		<p\n			style=\"color: #1d2227; line-height: 28px; font-size: 25px; margin: 12px 10px 16px 10px; font-weight: 400;\">Welcome\n			to signalADoc</p>\n		<p style=\"margin: 0 10px 10px 10px; padding: 0; font-size: 14px;\">\n			Thanks for signing up. To send your first Toxsl, please verify<br>\n			your email address by clicking the button below.\n		</p>\n		<p>\n			<a\n				style=\"display: inline-block; text-decoration: none; padding: 11px 20px; background-color: #6dbd63; border: 1px solid #6dbd63; border-radius: 3px; color: #FFF; font-weight: bold;\"\n				href=\"http://beta.toxsl.in/signal-a-doc/user/confirm-email\" target=\"_blank\">Activate your account and\n				log in</a>\n		</p>\n		<p>\n			<font size=\"2\" color=\"#333\"> If above link isn\'t working, please copy\n				and paste it directly in you browser\'s URL field to get started.<br />\n				<br />\n	                          \n	                              http://beta.toxsl.in/signal-a-doc/user/confirm-email								</font>\n		</p>\n	</td>\n</tr>\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Welcome! Your new account is ready Toxsl', '2020-04-02 05:53:22', NULL, '2020-04-02 17:53:22', NULL, 0, NULL, NULL, NULL, NULL),
(157, 'admin@toxsl.in', 'pass@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td align=\"left\"\n		style=\"font-family: Lato, sans-serif; padding-top: 30px; padding-bottom: 0; color: #333333;\"><h3\n			style=\"margin: 0; font-weight: 500; font-size: 19px;\">Hi James James,</h3></td>\n</tr>\n\n<tr>\n\n	<td align=\"left\">\n		<p\n			style=\"font-size: 14px; padding: 0 0px 23px; border-bottom: 1px solid #ececec; text-align: left; color: #666; margin-bottom: 8px;\">New Appointment has been booked by Pass Singh. You can seen the user details below :</p>\n\n		<p\n			style=\"font-size: 14px; padding: 0 0px 23px; border-bottom: 1px solid #ececec; text-align: left; color: #666; margin-bottom: 8px;\">\n			\n			Username:Pass Singh</br> </br>\n			User Email:pass@signal.com</br> </br>\n		</p>\n\n\n	</td>\n</tr>\n\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Appointment Alert', '2020-04-02 05:56:12', NULL, '2020-04-02 17:56:12', NULL, 0, NULL, NULL, NULL, NULL),
(158, 'admin@toxsl.in', 'riya@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td align=\"left\"\n		style=\"font-family: Lato, sans-serif; padding-top: 30px; padding-bottom: 0; color: #333333;\"><h3\n			style=\"margin: 0; font-weight: 500; font-size: 19px;\">Hi Riya Mahajan,</h3></td>\n</tr>\n\n<tr>\n\n	<td align=\"left\">\n		<p\n			style=\"font-size: 14px; padding: 0 0px 23px; border-bottom: 1px solid #ececec; text-align: left; color: #666; margin-bottom: 8px;\">New Appointment has been booked by Pass Singh. You can seen the user details below :</p>\n\n		<p\n			style=\"font-size: 14px; padding: 0 0px 23px; border-bottom: 1px solid #ececec; text-align: left; color: #666; margin-bottom: 8px;\">\n			\n			Username:Pass Singh</br> </br>\n			User Email:pass@signal.com</br> </br>\n		</p>\n\n\n	</td>\n</tr>\n\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Appointment Alert', '2020-04-02 06:00:26', NULL, '2020-04-02 18:00:26', NULL, 0, NULL, NULL, NULL, NULL),
(159, 'admin@toxsl.in', 'riya@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td align=\"left\"\n		style=\"font-family: Lato, sans-serif; padding-top: 30px; padding-bottom: 0; color: #333333;\"><h3\n			style=\"margin: 0; font-weight: 500; font-size: 19px;\">Hi Riya Mahajan,</h3></td>\n</tr>\n\n<tr>\n\n	<td align=\"left\">\n		<p\n			style=\"font-size: 14px; padding: 0 0px 23px; border-bottom: 1px solid #ececec; text-align: left; color: #666; margin-bottom: 8px;\">New Appointment has been booked by Pass Singh. You can seen the user details below :</p>\n\n		<p\n			style=\"font-size: 14px; padding: 0 0px 23px; border-bottom: 1px solid #ececec; text-align: left; color: #666; margin-bottom: 8px;\">\n			\n			Username:Pass Singh</br> </br>\n			User Email:pass@signal.com</br> </br>\n		</p>\n\n\n	</td>\n</tr>\n\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Appointment Alert', '2020-04-02 06:00:39', NULL, '2020-04-02 18:00:39', NULL, 0, NULL, NULL, NULL, NULL),
(160, 'admin@toxsl.in', 'pass@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td align=\"left\"\n		style=\"font-family: Lato, sans-serif; padding-top: 30px; padding-bottom: 0; color: #333333;\"><h3\n			style=\"margin: 0; font-weight: 500; font-size: 19px;\">Hi James James,</h3></td>\n</tr>\n\n<tr>\n\n	<td align=\"left\">\n		<p\n			style=\"font-size: 14px; padding: 0 0px 23px; border-bottom: 1px solid #ececec; text-align: left; color: #666; margin-bottom: 8px;\">New Appointment has been booked by Pass Singh. You can seen the user details below :</p>\n\n		<p\n			style=\"font-size: 14px; padding: 0 0px 23px; border-bottom: 1px solid #ececec; text-align: left; color: #666; margin-bottom: 8px;\">\n			\n			Username:Pass Singh</br> </br>\n			User Email:pass@signal.com</br> </br>\n		</p>\n\n\n	</td>\n</tr>\n\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Appointment Alert', '2020-04-02 06:04:31', NULL, '2020-04-02 18:04:31', NULL, 0, NULL, NULL, NULL, NULL),
(161, 'admin@toxsl.in', 'pass@doctor.com', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<style>\nbody {\n	font-family: \"Lato\", sans-serif;\n}\n\np {\n	line-height: 25px;\n	margin: 0;\n}\n\n.border-radius {\n	border-radius: 4px;\n}\n</style>\n</head>\n<body>\n	<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n		<tr>\n			<td align=\"center\" valign=\"top\">\n				<table class=\"border-radius\" width=\"630px\" cellpadding=\"15\"\n					cellspacing=\"0\" style=\"border: 1px solid #eee;\">\n					<thead>\n						<tr>\n							<th align=\"left\" bgcolor=\"#00A65A\"\n								style=\"border-bottom-left-radius: 0 !important; border-bottom-right-radius: 0 !important; border-radius: 4px; padding: 5px 13px 3px;\"><h3\n									style=\"font-size: 16px; font-weight: 400; color: #fff;\">signalADoc</h3></th>\n						</tr>\n					</thead>\n					<tbody>\n					<td><tr>\n	<td align=\"left\"\n		style=\"font-family: Lato, sans-serif; padding-top: 30px; padding-bottom: 0; color: #333333;\"><h3\n			style=\"margin: 0; font-weight: 500; font-size: 19px;\">Hi James James,</h3></td>\n</tr>\n\n<tr>\n\n	<td align=\"left\">\n		<p\n			style=\"font-size: 14px; padding: 0 0px 23px; border-bottom: 1px solid #ececec; text-align: left; color: #666; margin-bottom: 8px;\">New Appointment has been booked by Pass Singh. You can seen the user details below :</p>\n\n		<p\n			style=\"font-size: 14px; padding: 0 0px 23px; border-bottom: 1px solid #ececec; text-align: left; color: #666; margin-bottom: 8px;\">\n			\n			Username:Pass Singh</br> </br>\n			User Email:pass@signal.com</br> </br>\n		</p>\n\n\n	</td>\n</tr>\n\n</td>\n<tr>\n	<td align=\"left\" style=\"padding-top: 8px; padding-bottom: 3px;\">\n		<p\n			style=\"font-size: 14px; border-top: 1px solid #ececec; padding: 16px 0px 4px; text-align: left; color: #666; margin-top: 10px;\"></p>\n		<p\n			style=\"font-size: 14px; padding: 0 0px 20px; text-align: left; color: #666\">\n			Thanks & Regards,<br>signalADoc Team.</p>\n	</td>\n</tr>\n</tbody>\n\n<tfoot>\n	<tr>\n		<td\n			style=\"border-radius: 4px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 25px; font-family: Lato, sans-serif; border-top: 1px solid #ebebeb; border-bottom: 0;\"\n			align=\"left\" bgcolor=\"#00A65A\"><h3\n				style=\"font-size: 15px; font-weight: 400; color: #fff; margin: 0;\">Copyright\n									&copy; signalADoc</h3></td>\n	</tr>\n</tfoot>\n</table>\n</td>\n</tr>\n</table>\n</body>\n</html>', 'Appointment Alert', '2020-04-02 06:17:33', NULL, '2020-04-02 18:17:33', NULL, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_favorite`
--

CREATE TABLE `tbl_favorite` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `state_id` int(11) NOT NULL DEFAULT '1',
  `type_id` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feed`
--

CREATE TABLE `tbl_feed` (
  `id` int(11) NOT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `model_type` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_feed`
--

INSERT INTO `tbl_feed` (`id`, `content`, `model_type`, `model_id`, `state_id`, `type_id`, `created_on`, `updated_on`, `created_by_id`) VALUES
(1, 'Created new User ', 'app\\models\\User', 1, 1, 0, '2020-03-06 10:50:45', '2020-03-06 10:50:45', NULL),
(2, 'Created new Setting ', 'app\\models\\Setting', 1, 1, 0, '2020-03-06 10:50:45', '2020-03-06 10:50:45', 1),
(3, 'Created new Setting ', 'app\\models\\Setting', 2, 1, 0, '2020-03-06 10:50:45', '2020-03-06 10:50:45', 1),
(4, 'Created new Setting ', 'app\\models\\Setting', 3, 1, 0, '2020-03-06 10:50:45', '2020-03-06 10:50:45', 1),
(5, 'Created new Setting ', 'app\\models\\Setting', 4, 1, 0, '2020-03-06 10:50:45', '2020-03-06 10:50:45', 1),
(6, 'Created new Setting ', 'app\\models\\Setting', 5, 1, 0, '2020-03-06 10:50:45', '2020-03-06 10:50:45', 1),
(7, 'Created new Setting ', 'app\\models\\Setting', 6, 1, 0, '2020-03-06 10:50:45', '2020-03-06 10:50:45', 1),
(9, 'Created new Category ', 'app\\models\\Category', 1, 1, 0, '2020-03-06 11:06:45', '2020-03-06 11:06:45', 1),
(10, 'Created new Category ', 'app\\models\\Category', 2, 1, 0, '2020-03-06 11:07:00', '2020-03-06 11:07:00', 1),
(11, 'Created new Category ', 'app\\models\\Category', 3, 1, 0, '2020-03-06 11:07:48', '2020-03-06 11:07:48', 1),
(12, 'Created new Category ', 'app\\models\\Category', 4, 1, 0, '2020-03-06 11:07:56', '2020-03-06 11:07:56', 1),
(25, 'Created new User Wallet ', 'app\\models\\UserWallet', 1, 1, 0, '2020-03-06 11:41:37', '2020-03-06 11:41:37', NULL),
(39, 'Modified User ', 'app\\models\\User', 1, 1, 0, '2020-03-06 12:53:40', '2020-03-06 12:53:40', 1),
(43, 'Created new User ', 'app\\models\\User', 2, 1, 0, '2020-03-06 13:22:24', '2020-03-06 13:22:24', NULL),
(44, 'Created new User Wallet ', 'app\\models\\UserWallet', 1, 1, 0, '2020-03-06 13:22:24', '2020-03-06 13:22:24', NULL),
(45, 'Created new Patient Medical Information ', 'app\\models\\PatientMedicalInformation', 3, 1, 0, '2020-03-06 13:22:24', '2020-03-06 13:22:24', NULL),
(46, 'Created new Patientsymptom ', 'app\\models\\Patientsymptom', 7, 1, 0, '2020-03-06 13:22:24', '2020-03-06 13:22:24', NULL),
(47, 'Created new Patientsymptom ', 'app\\models\\Patientsymptom', 8, 1, 0, '2020-03-06 13:22:24', '2020-03-06 13:22:24', NULL),
(48, 'Created new Patientsymptom ', 'app\\models\\Patientsymptom', 9, 1, 0, '2020-03-06 13:22:24', '2020-03-06 13:22:24', NULL),
(83, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 1, 1, 0, '2020-03-06 17:33:09', '2020-03-06 17:33:09', 5),
(84, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 1, 1, 0, '2020-03-06 17:33:21', '2020-03-06 17:33:21', 5),
(88, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 2, 1, 0, '2020-03-06 17:33:51', '2020-03-06 17:33:51', 5),
(100, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 3, 1, 0, '2020-03-06 17:45:22', '2020-03-06 17:45:22', 5),
(114, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 5, 1, 0, '2020-03-06 18:00:12', '2020-03-06 18:00:12', 8),
(115, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 5, 1, 0, '2020-03-06 18:00:26', '2020-03-06 18:00:26', 8),
(124, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 6, 1, 0, '2020-03-06 18:02:50', '2020-03-06 18:02:50', 9),
(125, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 6, 1, 0, '2020-03-06 18:05:03', '2020-03-06 18:05:03', 9),
(142, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 7, 1, 0, '2020-03-06 18:10:06', '2020-03-06 18:10:06', 11),
(145, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 8, 1, 0, '2020-03-06 18:11:01', '2020-03-06 18:11:01', 11),
(148, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 9, 1, 0, '2020-03-06 18:19:03', '2020-03-06 18:19:03', 11),
(149, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 9, 1, 0, '2020-03-06 18:25:38', '2020-03-06 18:25:38', 11),
(150, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 9, 1, 0, '2020-03-06 18:36:28', '2020-03-06 18:36:28', 11),
(151, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 9, 1, 0, '2020-03-06 18:45:06', '2020-03-06 18:45:06', 11),
(153, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 9, 1, 0, '2020-03-06 18:49:05', '2020-03-06 18:49:05', 11),
(161, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 9, 1, 0, '2020-03-06 18:51:43', '2020-03-06 18:51:43', 11),
(172, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 10, 1, 0, '2020-03-06 18:56:49', '2020-03-06 18:56:49', 14),
(174, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 9, 1, 0, '2020-03-06 18:59:59', '2020-03-06 18:59:59', 11),
(183, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 9, 1, 0, '2020-03-06 19:00:56', '2020-03-06 19:00:56', 11),
(194, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 12, 1, 0, '2020-03-06 19:10:44', '2020-03-06 19:10:44', 16),
(235, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 15, 1, 0, '2020-03-06 19:25:21', '2020-03-06 19:25:21', 21),
(236, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 15, 1, 0, '2020-03-06 19:29:45', '2020-03-06 19:29:45', 21),
(246, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 16, 1, 0, '2020-03-06 20:14:23', '2020-03-06 20:14:23', 21),
(247, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 16, 1, 0, '2020-03-06 20:22:34', '2020-03-06 20:22:34', 21),
(248, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 16, 1, 0, '2020-03-06 20:23:50', '2020-03-06 20:23:50', 21),
(249, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 16, 1, 0, '2020-03-06 20:24:56', '2020-03-06 20:24:56', 21),
(250, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 16, 1, 0, '2020-03-06 20:26:56', '2020-03-06 20:26:56', 21),
(251, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 16, 1, 0, '2020-03-06 20:30:54', '2020-03-06 20:30:54', 21),
(252, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 16, 1, 0, '2020-03-06 20:32:05', '2020-03-06 20:32:05', 21),
(266, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 17, 1, 0, '2020-03-06 20:44:02', '2020-03-06 20:44:02', 23),
(301, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 18, 1, 0, '2020-03-06 21:37:37', '2020-03-06 21:37:37', 31),
(302, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 18, 1, 0, '2020-03-06 21:38:14', '2020-03-06 21:38:14', 31),
(313, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 19, 1, 0, '2020-03-06 21:40:16', '2020-03-06 21:40:16', 32),
(346, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 20, 1, 0, '2020-03-06 21:50:30', '2020-03-06 21:50:30', 40),
(350, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 21, 1, 0, '2020-03-06 21:52:30', '2020-03-06 21:52:30', 40),
(387, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 22, 1, 0, '2020-03-06 22:02:36', '2020-03-06 22:02:36', 48),
(441, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 23, 1, 0, '2020-03-06 22:11:31', '2020-03-06 22:11:31', 63),
(454, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 24, 1, 0, '2020-03-06 23:40:14', '2020-03-06 23:40:14', 64),
(455, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 24, 1, 0, '2020-03-06 23:43:06', '2020-03-06 23:43:06', 64),
(470, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 25, 1, 0, '2020-03-06 23:49:11', '2020-03-06 23:49:11', 65),
(471, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 25, 1, 0, '2020-03-07 00:57:47', '2020-03-07 00:57:47', 65),
(495, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 27, 1, 0, '2020-03-07 09:38:16', '2020-03-07 09:38:16', 63),
(496, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 27, 1, 0, '2020-03-07 09:41:46', '2020-03-07 09:41:46', 63),
(506, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 28, 1, 0, '2020-03-07 10:09:56', '2020-03-07 10:09:56', 69),
(507, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 28, 1, 0, '2020-03-07 10:10:36', '2020-03-07 10:10:36', 69),
(508, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 28, 1, 0, '2020-03-07 10:12:09', '2020-03-07 10:12:09', 69),
(509, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 28, 1, 0, '2020-03-07 10:13:46', '2020-03-07 10:13:46', 69),
(526, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 29, 1, 0, '2020-03-07 12:05:25', '2020-03-07 12:05:25', 69),
(527, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 29, 1, 0, '2020-03-07 12:05:32', '2020-03-07 12:05:32', 69),
(528, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 29, 1, 0, '2020-03-07 12:06:28', '2020-03-07 12:06:28', 69),
(531, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 30, 1, 0, '2020-03-07 12:07:00', '2020-03-07 12:07:00', 69),
(532, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 30, 1, 0, '2020-03-07 12:07:40', '2020-03-07 12:07:40', 69),
(536, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 31, 1, 0, '2020-03-07 12:12:02', '2020-03-07 12:12:02', 69),
(539, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 32, 1, 0, '2020-03-07 12:21:13', '2020-03-07 12:21:13', 69),
(540, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 32, 1, 0, '2020-03-07 12:22:01', '2020-03-07 12:22:01', 69),
(544, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 33, 1, 0, '2020-03-07 12:25:03', '2020-03-07 12:25:03', 69),
(548, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 34, 1, 0, '2020-03-07 12:26:18', '2020-03-07 12:26:18', 69),
(549, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 34, 1, 0, '2020-03-07 12:28:12', '2020-03-07 12:28:12', 69),
(550, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 25, 1, 0, '2020-03-07 12:28:20', '2020-03-07 12:28:20', 65),
(552, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 34, 1, 0, '2020-03-07 12:29:12', '2020-03-07 12:29:12', 69),
(553, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 34, 1, 0, '2020-03-07 12:29:55', '2020-03-07 12:29:55', 69),
(554, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 34, 1, 0, '2020-03-07 12:31:11', '2020-03-07 12:31:11', 69),
(555, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 34, 1, 0, '2020-03-07 12:31:38', '2020-03-07 12:31:38', 69),
(556, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 34, 1, 0, '2020-03-07 12:32:08', '2020-03-07 12:32:08', 69),
(557, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 34, 1, 0, '2020-03-07 12:32:27', '2020-03-07 12:32:27', 69),
(558, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 34, 1, 0, '2020-03-07 12:33:08', '2020-03-07 12:33:08', 69),
(559, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 34, 1, 0, '2020-03-07 12:36:18', '2020-03-07 12:36:18', 69),
(560, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 34, 1, 0, '2020-03-07 12:37:38', '2020-03-07 12:37:38', 69),
(564, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 35, 1, 0, '2020-03-07 12:40:21', '2020-03-07 12:40:21', 69),
(565, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 35, 1, 0, '2020-03-07 12:42:47', '2020-03-07 12:42:47', 69),
(568, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 36, 1, 0, '2020-03-07 12:43:01', '2020-03-07 12:43:01', 69),
(572, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 37, 1, 0, '2020-03-07 12:44:53', '2020-03-07 12:44:53', 69),
(576, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 38, 1, 0, '2020-03-07 12:46:53', '2020-03-07 12:46:53', 69),
(579, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 39, 1, 0, '2020-03-07 12:47:57', '2020-03-07 12:47:57', 69),
(583, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 40, 1, 0, '2020-03-07 12:51:38', '2020-03-07 12:51:38', 69),
(595, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 42, 1, 0, '2020-03-07 12:58:37', '2020-03-07 12:58:37', 72),
(596, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 42, 1, 0, '2020-03-07 13:05:36', '2020-03-07 13:05:36', 72),
(597, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 42, 1, 0, '2020-03-07 13:10:24', '2020-03-07 13:10:24', 72),
(598, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 42, 1, 0, '2020-03-07 13:12:03', '2020-03-07 13:12:03', 72),
(599, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 42, 1, 0, '2020-03-07 13:13:53', '2020-03-07 13:13:53', 72),
(600, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 42, 1, 0, '2020-03-07 13:15:20', '2020-03-07 13:15:20', 72),
(601, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 42, 1, 0, '2020-03-07 13:16:59', '2020-03-07 13:16:59', 72),
(602, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 42, 1, 0, '2020-03-07 13:17:55', '2020-03-07 13:17:55', 72),
(603, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 42, 1, 0, '2020-03-07 13:18:23', '2020-03-07 13:18:23', 72),
(604, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 42, 1, 0, '2020-03-07 13:20:25', '2020-03-07 13:20:25', 72),
(605, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 42, 1, 0, '2020-03-07 13:21:15', '2020-03-07 13:21:15', 72),
(606, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 25, 1, 0, '2020-03-07 13:25:31', '2020-03-07 13:25:31', 65),
(607, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 42, 1, 0, '2020-03-07 13:27:32', '2020-03-07 13:27:32', 72),
(608, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 42, 1, 0, '2020-03-07 13:27:54', '2020-03-07 13:27:54', 72),
(609, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 42, 1, 0, '2020-03-07 13:28:36', '2020-03-07 13:28:36', 72),
(610, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 42, 1, 0, '2020-03-07 13:28:59', '2020-03-07 13:28:59', 72),
(611, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 42, 1, 0, '2020-03-07 13:29:51', '2020-03-07 13:29:51', 72),
(612, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 42, 1, 0, '2020-03-07 13:30:10', '2020-03-07 13:30:10', 72),
(613, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 42, 1, 0, '2020-03-07 13:30:29', '2020-03-07 13:30:29', 72),
(615, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 25, 1, 0, '2020-03-07 13:51:49', '2020-03-07 13:51:49', 65),
(620, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 42, 1, 0, '2020-03-07 14:37:44', '2020-03-07 14:37:44', 72),
(621, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 42, 1, 0, '2020-03-07 14:39:26', '2020-03-07 14:39:26', 72),
(622, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 42, 1, 0, '2020-03-07 15:04:34', '2020-03-07 15:04:34', 72),
(623, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 42, 1, 0, '2020-03-07 15:09:34', '2020-03-07 15:09:34', 72),
(624, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 42, 1, 0, '2020-03-07 15:15:52', '2020-03-07 15:15:52', 72),
(625, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 42, 1, 0, '2020-03-07 15:16:39', '2020-03-07 15:16:39', 72),
(626, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 42, 1, 0, '2020-03-07 15:17:58', '2020-03-07 15:17:58', 72),
(627, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 42, 1, 0, '2020-03-07 15:19:34', '2020-03-07 15:19:34', 72),
(628, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 42, 1, 0, '2020-03-07 15:20:53', '2020-03-07 15:20:53', 72),
(629, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 42, 1, 0, '2020-03-07 15:22:49', '2020-03-07 15:22:49', 72),
(630, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 42, 1, 0, '2020-03-07 15:26:40', '2020-03-07 15:26:40', 72),
(631, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 42, 1, 0, '2020-03-07 15:28:00', '2020-03-07 15:28:00', 72),
(632, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 42, 1, 0, '2020-03-07 15:28:38', '2020-03-07 15:28:38', 72),
(637, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 43, 1, 0, '2020-03-07 15:35:05', '2020-03-07 15:35:05', 72),
(647, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 44, 1, 0, '2020-03-07 15:42:24', '2020-03-07 15:42:24', 73),
(648, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 43, 1, 0, '2020-03-07 15:43:31', '2020-03-07 15:43:31', 72),
(650, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 43, 1, 0, '2020-03-07 15:47:14', '2020-03-07 15:47:14', 72),
(656, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 43, 1, 0, '2020-03-07 15:48:47', '2020-03-07 15:48:47', 72),
(657, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 43, 1, 0, '2020-03-07 15:49:45', '2020-03-07 15:49:45', 72),
(658, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 43, 1, 0, '2020-03-07 15:49:58', '2020-03-07 15:49:58', 72),
(659, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 43, 1, 0, '2020-03-07 15:53:01', '2020-03-07 15:53:01', 72),
(660, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 43, 1, 0, '2020-03-07 15:54:32', '2020-03-07 15:54:32', 72),
(665, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 45, 1, 0, '2020-03-07 15:55:20', '2020-03-07 15:55:20', 72),
(666, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 45, 1, 0, '2020-03-07 15:55:43', '2020-03-07 15:55:43', 72),
(667, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 45, 1, 0, '2020-03-07 15:57:10', '2020-03-07 15:57:10', 72),
(668, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 45, 1, 0, '2020-03-07 16:01:12', '2020-03-07 16:01:12', 72),
(669, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 45, 1, 0, '2020-03-07 16:01:40', '2020-03-07 16:01:40', 72),
(670, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 45, 1, 0, '2020-03-07 16:03:28', '2020-03-07 16:03:28', 72),
(671, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 45, 1, 0, '2020-03-07 16:07:30', '2020-03-07 16:07:30', 72),
(672, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 45, 1, 0, '2020-03-07 16:08:14', '2020-03-07 16:08:14', 72),
(673, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 45, 1, 0, '2020-03-07 16:08:44', '2020-03-07 16:08:44', 72),
(674, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 45, 1, 0, '2020-03-07 16:10:30', '2020-03-07 16:10:30', 72),
(675, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 45, 1, 0, '2020-03-07 16:20:48', '2020-03-07 16:20:48', 72),
(676, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 45, 1, 0, '2020-03-07 16:23:33', '2020-03-07 16:23:33', 72),
(685, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 46, 1, 0, '2020-03-07 16:29:44', '2020-03-07 16:29:44', 72),
(686, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 46, 1, 0, '2020-03-07 16:35:10', '2020-03-07 16:35:10', 72),
(687, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 46, 1, 0, '2020-03-07 16:39:13', '2020-03-07 16:39:13', 72),
(688, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 46, 1, 0, '2020-03-07 16:39:54', '2020-03-07 16:39:54', 72),
(689, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 46, 1, 0, '2020-03-07 16:41:14', '2020-03-07 16:41:14', 72),
(692, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 47, 1, 0, '2020-03-07 16:42:25', '2020-03-07 16:42:25', 72),
(714, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 48, 1, 0, '2020-03-07 16:46:24', '2020-03-07 16:46:24', 72),
(723, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 49, 1, 0, '2020-03-07 16:47:45', '2020-03-07 16:47:45', 81),
(726, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 50, 1, 0, '2020-03-07 16:50:04', '2020-03-07 16:50:04', 72),
(729, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 51, 1, 0, '2020-03-07 16:53:12', '2020-03-07 16:53:12', 72),
(733, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 52, 1, 0, '2020-03-07 16:53:27', '2020-03-07 16:53:27', 72),
(734, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 52, 1, 0, '2020-03-07 16:54:21', '2020-03-07 16:54:21', 72),
(737, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 53, 1, 0, '2020-03-07 16:54:45', '2020-03-07 16:54:45', 72),
(738, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 53, 1, 0, '2020-03-07 16:55:26', '2020-03-07 16:55:26', 72),
(739, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 53, 1, 0, '2020-03-07 16:56:29', '2020-03-07 16:56:29', 72),
(740, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 53, 1, 0, '2020-03-07 16:57:25', '2020-03-07 16:57:25', 72),
(741, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 53, 1, 0, '2020-03-07 16:57:59', '2020-03-07 16:57:59', 72),
(742, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 53, 1, 0, '2020-03-07 16:59:03', '2020-03-07 16:59:03', 72),
(746, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 54, 1, 0, '2020-03-07 17:02:29', '2020-03-07 17:02:29', 72),
(749, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 55, 1, 0, '2020-03-07 17:03:20', '2020-03-07 17:03:20', 72),
(750, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 55, 1, 0, '2020-03-07 17:04:05', '2020-03-07 17:04:05', 72),
(751, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 55, 1, 0, '2020-03-07 17:05:00', '2020-03-07 17:05:00', 72),
(752, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 55, 1, 0, '2020-03-07 17:05:27', '2020-03-07 17:05:27', 72),
(756, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 56, 1, 0, '2020-03-07 17:08:57', '2020-03-07 17:08:57', 72),
(757, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 56, 1, 0, '2020-03-07 17:09:49', '2020-03-07 17:09:49', 72),
(762, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 57, 1, 0, '2020-03-07 17:11:19', '2020-03-07 17:11:19', 72),
(764, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 57, 1, 0, '2020-03-07 17:13:15', '2020-03-07 17:13:15', 72),
(791, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 57, 1, 0, '2020-03-07 17:30:27', '2020-03-07 17:30:27', 72),
(792, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 57, 1, 0, '2020-03-07 17:33:00', '2020-03-07 17:33:00', 72),
(793, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 57, 1, 0, '2020-03-07 17:33:22', '2020-03-07 17:33:22', 72),
(794, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 57, 1, 0, '2020-03-07 17:33:41', '2020-03-07 17:33:41', 72),
(795, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 57, 1, 0, '2020-03-07 17:34:35', '2020-03-07 17:34:35', 72),
(796, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 57, 1, 0, '2020-03-07 17:34:40', '2020-03-07 17:34:40', 72),
(797, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 57, 1, 0, '2020-03-07 17:36:06', '2020-03-07 17:36:06', 72),
(805, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 59, 1, 0, '2020-03-07 17:38:50', '2020-03-07 17:38:50', 81),
(808, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 60, 1, 0, '2020-03-07 17:44:58', '2020-03-07 17:44:58', 72),
(809, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 60, 1, 0, '2020-03-07 17:45:34', '2020-03-07 17:45:34', 72),
(810, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 60, 1, 0, '2020-03-07 17:47:06', '2020-03-07 17:47:06', 72),
(819, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 61, 1, 0, '2020-03-07 17:54:28', '2020-03-07 17:54:28', 81),
(832, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 63, 1, 0, '2020-03-07 17:58:27', '2020-03-07 17:58:27', 72),
(835, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 64, 1, 0, '2020-03-07 17:58:36', '2020-03-07 17:58:36', 72),
(849, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 66, 1, 0, '2020-03-07 18:02:33', '2020-03-07 18:02:33', 89),
(857, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 67, 1, 0, '2020-03-07 18:16:34', '2020-03-07 18:16:34', 90),
(858, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 67, 1, 0, '2020-03-07 18:19:23', '2020-03-07 18:19:23', 90),
(867, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 68, 1, 0, '2020-03-07 18:30:59', '2020-03-07 18:30:59', 91),
(870, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 69, 1, 0, '2020-03-07 18:39:26', '2020-03-07 18:39:26', 91),
(883, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 69, 1, 0, '2020-03-07 19:21:48', '2020-03-07 19:21:48', 91),
(884, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 67, 1, 0, '2020-03-07 19:22:10', '2020-03-07 19:22:10', 90),
(885, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 67, 1, 0, '2020-03-07 19:37:41', '2020-03-07 19:37:41', 90),
(891, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 69, 1, 0, '2020-03-07 19:43:59', '2020-03-07 19:43:59', 91),
(892, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 69, 1, 0, '2020-03-07 19:44:11', '2020-03-07 19:44:11', 91),
(897, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 69, 1, 0, '2020-03-07 20:00:07', '2020-03-07 20:00:07', 91),
(899, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 67, 1, 0, '2020-03-07 22:38:02', '2020-03-07 22:38:02', 90),
(902, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 72, 1, 0, '2020-03-08 00:15:31', '2020-03-08 00:15:31', 91),
(903, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 67, 1, 0, '2020-03-08 04:39:44', '2020-03-08 04:39:44', 90),
(904, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 72, 1, 0, '2020-03-09 14:35:24', '2020-03-09 14:35:24', 91),
(905, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 72, 1, 0, '2020-03-09 14:46:24', '2020-03-09 14:46:24', 91),
(906, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 72, 1, 0, '2020-03-09 14:46:40', '2020-03-09 14:46:40', 91),
(907, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 72, 1, 0, '2020-03-09 15:38:30', '2020-03-09 15:38:30', 91),
(908, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 67, 1, 0, '2020-03-09 20:19:56', '2020-03-09 20:19:56', 90),
(909, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 67, 1, 0, '2020-03-09 20:20:42', '2020-03-09 20:20:42', 90),
(911, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 72, 1, 0, '2020-03-09 20:33:24', '2020-03-09 20:33:24', 91),
(921, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 72, 1, 0, '2020-03-12 10:46:47', '2020-03-12 10:46:47', 94),
(922, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 72, 1, 0, '2020-03-12 11:07:04', '2020-03-12 11:07:04', 94),
(923, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 72, 1, 0, '2020-03-12 11:16:19', '2020-03-12 11:16:19', 94),
(924, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 72, 1, 0, '2020-03-12 11:19:32', '2020-03-12 11:19:32', 94),
(928, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 72, 1, 0, '2020-03-12 11:22:37', '2020-03-12 11:22:37', 94),
(932, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 72, 1, 0, '2020-03-12 11:30:03', '2020-03-12 11:30:03', 94),
(933, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 72, 1, 0, '2020-03-12 11:31:20', '2020-03-12 11:31:20', 94),
(934, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 72, 1, 0, '2020-03-12 11:32:24', '2020-03-12 11:32:24', 94),
(935, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 72, 1, 0, '2020-03-12 11:39:58', '2020-03-12 11:39:58', 94),
(938, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 72, 1, 0, '2020-03-12 11:47:08', '2020-03-12 11:47:08', 94),
(968, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 74, 1, 0, '2020-03-12 12:48:00', '2020-03-12 12:48:00', 95),
(982, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 75, 1, 0, '2020-03-12 14:54:59', '2020-03-12 14:54:59', 95),
(985, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 76, 1, 0, '2020-03-12 15:08:42', '2020-03-12 15:08:42', 96),
(995, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 77, 1, 0, '2020-03-12 15:51:19', '2020-03-12 15:51:19', 95),
(996, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 77, 1, 0, '2020-03-12 15:56:52', '2020-03-12 15:56:52', 95),
(997, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 77, 1, 0, '2020-03-12 15:57:17', '2020-03-12 15:57:17', 95),
(998, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 77, 1, 0, '2020-03-12 15:58:23', '2020-03-12 15:58:23', 95),
(999, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 77, 1, 0, '2020-03-12 15:59:09', '2020-03-12 15:59:09', 95),
(1000, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 77, 1, 0, '2020-03-12 15:59:31', '2020-03-12 15:59:31', 95),
(1001, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 77, 1, 0, '2020-03-12 15:59:56', '2020-03-12 15:59:56', 95),
(1002, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 77, 1, 0, '2020-03-12 16:05:03', '2020-03-12 16:05:03', 95),
(1003, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 77, 1, 0, '2020-03-12 16:05:32', '2020-03-12 16:05:32', 95),
(1004, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 77, 1, 0, '2020-03-12 16:06:13', '2020-03-12 16:06:13', 95),
(1005, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 77, 1, 0, '2020-03-12 16:10:54', '2020-03-12 16:10:54', 95),
(1006, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 77, 1, 0, '2020-03-12 16:12:00', '2020-03-12 16:12:00', 95),
(1007, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 77, 1, 0, '2020-03-12 16:14:08', '2020-03-12 16:14:08', 95),
(1008, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 77, 1, 0, '2020-03-12 16:17:51', '2020-03-12 16:17:51', 95),
(1009, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 77, 1, 0, '2020-03-12 16:18:51', '2020-03-12 16:18:51', 95),
(1010, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 77, 1, 0, '2020-03-12 16:32:54', '2020-03-12 16:32:54', 95),
(1011, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 77, 1, 0, '2020-03-12 16:34:07', '2020-03-12 16:34:07', 95),
(1012, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 77, 1, 0, '2020-03-12 16:34:48', '2020-03-12 16:34:48', 95),
(1013, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 77, 1, 0, '2020-03-12 16:35:30', '2020-03-12 16:35:30', 95),
(1014, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 77, 1, 0, '2020-03-12 16:43:24', '2020-03-12 16:43:24', 95),
(1015, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 77, 1, 0, '2020-03-12 16:45:26', '2020-03-12 16:45:26', 95),
(1016, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 77, 1, 0, '2020-03-12 16:47:16', '2020-03-12 16:47:16', 95),
(1017, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 77, 1, 0, '2020-03-12 16:48:01', '2020-03-12 16:48:01', 95),
(1018, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 77, 1, 0, '2020-03-12 16:50:06', '2020-03-12 16:50:06', 95),
(1019, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 77, 1, 0, '2020-03-12 16:50:16', '2020-03-12 16:50:16', 95),
(1020, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 77, 1, 0, '2020-03-12 16:50:49', '2020-03-12 16:50:49', 95),
(1031, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 78, 1, 0, '2020-03-12 16:59:16', '2020-03-12 16:59:16', 96),
(1034, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 77, 1, 0, '2020-03-12 17:05:07', '2020-03-12 17:05:07', 95),
(1035, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 77, 1, 0, '2020-03-12 17:06:20', '2020-03-12 17:06:20', 95),
(1047, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 79, 1, 0, '2020-03-12 17:17:50', '2020-03-12 17:17:50', 99),
(1098, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 81, 1, 0, '2020-03-12 18:36:09', '2020-03-12 18:36:09', 108),
(1106, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 82, 1, 0, '2020-03-12 19:33:01', '2020-03-12 19:33:01', 109),
(1114, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 83, 1, 0, '2020-03-12 21:29:26', '2020-03-12 21:29:26', 110),
(1115, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 83, 1, 0, '2020-03-12 21:35:38', '2020-03-12 21:35:38', 110),
(1116, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 83, 1, 0, '2020-03-12 21:52:37', '2020-03-12 21:52:37', 110),
(1128, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 85, 1, 0, '2020-03-12 22:23:50', '2020-03-12 22:23:50', 111),
(1140, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 86, 1, 0, '2020-03-12 23:46:20', '2020-03-12 23:46:20', 113),
(1141, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 86, 1, 0, '2020-03-12 23:50:48', '2020-03-12 23:50:48', 113),
(1145, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 87, 1, 0, '2020-03-13 02:47:27', '2020-03-13 02:47:27', 111),
(1146, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 86, 1, 0, '2020-03-13 03:26:17', '2020-03-13 03:26:17', 113),
(1147, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 86, 1, 0, '2020-03-13 03:26:38', '2020-03-13 03:26:38', 113),
(1151, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 86, 1, 0, '2020-03-13 10:28:59', '2020-03-13 10:28:59', 113),
(1160, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 87, 1, 0, '2020-03-13 13:09:47', '2020-03-13 13:09:47', 111),
(1164, 'Created new Doctorprofessionalstatus ', 'app\\models\\Doctorprofessionalstatus', 1, 1, 0, '2020-03-13 13:30:12', '2020-03-13 13:30:12', 1),
(1165, 'Created new Doctorprofessionalstatus ', 'app\\models\\Doctorprofessionalstatus', 2, 1, 0, '2020-03-13 13:30:18', '2020-03-13 13:30:18', 1),
(1167, 'Created new Workprofile ', 'app\\models\\search\\Workprofile', 1, 1, 0, '2020-03-13 13:49:25', '2020-03-13 13:49:25', 1),
(1173, 'Created new Login History ', 'app\\models\\LoginHistory', 1, 1, 0, '2020-03-13 14:49:30', '2020-03-13 14:49:30', NULL),
(1174, 'Created new Login History ', 'app\\models\\LoginHistory', 2, 1, 0, '2020-03-13 14:49:57', '2020-03-13 14:49:57', NULL),
(1175, 'Created new Login History ', 'app\\models\\LoginHistory', 3, 1, 0, '2020-03-13 14:50:11', '2020-03-13 14:50:11', NULL),
(1176, 'Created new Login History ', 'app\\models\\LoginHistory', 4, 1, 0, '2020-03-13 14:51:31', '2020-03-13 14:51:31', NULL),
(1178, 'Created new Login History ', 'app\\models\\LoginHistory', 5, 1, 0, '2020-03-13 14:59:50', '2020-03-13 14:59:50', NULL),
(1179, 'Created new Login History ', 'app\\models\\LoginHistory', 6, 1, 0, '2020-03-13 14:59:57', '2020-03-13 14:59:57', NULL),
(1180, 'Created new Login History ', 'app\\models\\LoginHistory', 7, 1, 0, '2020-03-13 15:00:57', '2020-03-13 15:00:57', NULL),
(1181, 'Created new Login History ', 'app\\models\\LoginHistory', 8, 1, 0, '2020-03-13 15:03:52', '2020-03-13 15:03:52', NULL),
(1182, 'Created new Login History ', 'app\\models\\LoginHistory', 9, 1, 0, '2020-03-13 15:05:11', '2020-03-13 15:05:11', NULL),
(1183, 'Created new Login History ', 'app\\models\\LoginHistory', 10, 1, 0, '2020-03-13 15:05:58', '2020-03-13 15:05:58', NULL),
(1190, 'Created new Login History ', 'app\\models\\LoginHistory', 11, 1, 0, '2020-03-13 15:06:59', '2020-03-13 15:06:59', NULL),
(1192, 'Created new Login History ', 'app\\models\\LoginHistory', 12, 1, 0, '2020-03-13 15:07:54', '2020-03-13 15:07:54', NULL),
(1193, 'Created new Login History ', 'app\\models\\LoginHistory', 13, 1, 0, '2020-03-13 15:08:20', '2020-03-13 15:08:20', NULL),
(1195, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 89, 1, 0, '2020-03-13 15:08:20', '2020-03-13 15:08:20', 115),
(1196, 'Created new Login History ', 'app\\models\\LoginHistory', 14, 1, 0, '2020-03-13 15:08:49', '2020-03-13 15:08:49', NULL),
(1199, 'Created new Login History ', 'app\\models\\LoginHistory', 15, 1, 0, '2020-03-13 15:09:00', '2020-03-13 15:09:00', NULL),
(1201, 'Created new Login History ', 'app\\models\\LoginHistory', 16, 1, 0, '2020-03-13 15:09:43', '2020-03-13 15:09:43', NULL),
(1203, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 91, 1, 0, '2020-03-13 15:09:44', '2020-03-13 15:09:44', 109),
(1204, 'Created new Login History ', 'app\\models\\LoginHistory', 17, 1, 0, '2020-03-13 15:10:14', '2020-03-13 15:10:14', NULL),
(1205, 'Created new Login History ', 'app\\models\\LoginHistory', 18, 1, 0, '2020-03-13 15:10:15', '2020-03-13 15:10:15', NULL),
(1208, 'Created new Login History ', 'app\\models\\LoginHistory', 19, 1, 0, '2020-03-13 15:11:35', '2020-03-13 15:11:35', NULL),
(1209, 'Created new Login History ', 'app\\models\\LoginHistory', 20, 1, 0, '2020-03-13 15:14:31', '2020-03-13 15:14:31', NULL),
(1213, 'Created new Login History ', 'app\\models\\LoginHistory', 21, 1, 0, '2020-03-13 17:03:29', '2020-03-13 17:03:29', NULL),
(1229, 'Created new Workprofile ', 'app\\models\\search\\Workprofile', 2, 1, 0, '2020-03-13 17:46:48', '2020-03-13 17:46:48', 1),
(1248, 'Created new Login History ', 'app\\models\\LoginHistory', 22, 1, 0, '2020-03-13 18:32:18', '2020-03-13 18:32:18', NULL),
(1249, 'Created new Login History ', 'app\\models\\LoginHistory', 23, 1, 0, '2020-03-13 18:33:22', '2020-03-13 18:33:22', NULL),
(1250, 'Created new Login History ', 'app\\models\\LoginHistory', 24, 1, 0, '2020-03-13 18:41:04', '2020-03-13 18:41:04', NULL),
(1251, 'Created new Login History ', 'app\\models\\LoginHistory', 25, 1, 0, '2020-03-13 19:47:54', '2020-03-13 19:47:54', NULL),
(1252, 'Created new Login History ', 'app\\models\\LoginHistory', 26, 1, 0, '2020-03-13 20:06:36', '2020-03-13 20:06:36', NULL),
(1253, 'Created new Login History ', 'app\\models\\LoginHistory', 27, 1, 0, '2020-03-14 09:42:59', '2020-03-14 09:42:59', NULL),
(1258, 'Created new Login History ', 'app\\models\\LoginHistory', 28, 1, 0, '2020-03-14 09:44:43', '2020-03-14 09:44:43', NULL),
(1260, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 93, 1, 0, '2020-03-14 09:44:43', '2020-03-14 09:44:43', 117),
(1261, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 93, 1, 0, '2020-03-14 09:47:26', '2020-03-14 09:47:26', 117),
(1262, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 93, 1, 0, '2020-03-14 11:36:17', '2020-03-14 11:36:17', 117),
(1263, 'Created new Login History ', 'app\\models\\LoginHistory', 29, 1, 0, '2020-03-14 12:13:48', '2020-03-14 12:13:48', NULL),
(1265, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 94, 1, 0, '2020-03-14 12:13:48', '2020-03-14 12:13:48', 117),
(1266, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 94, 1, 0, '2020-03-14 12:19:21', '2020-03-14 12:19:21', 117),
(1267, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 94, 1, 0, '2020-03-14 12:19:52', '2020-03-14 12:19:52', 117),
(1268, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 94, 1, 0, '2020-03-14 12:20:08', '2020-03-14 12:20:08', 117),
(1269, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 94, 1, 0, '2020-03-14 12:21:49', '2020-03-14 12:21:49', 117),
(1270, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 94, 1, 0, '2020-03-14 12:24:37', '2020-03-14 12:24:37', 117),
(1271, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 94, 1, 0, '2020-03-14 12:28:23', '2020-03-14 12:28:23', 117),
(1272, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 94, 1, 0, '2020-03-14 12:31:51', '2020-03-14 12:31:51', 117),
(1273, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 94, 1, 0, '2020-03-14 12:32:15', '2020-03-14 12:32:15', 117),
(1274, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 94, 1, 0, '2020-03-14 12:38:09', '2020-03-14 12:38:09', 117),
(1275, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 94, 1, 0, '2020-03-14 12:46:50', '2020-03-14 12:46:50', 117),
(1276, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 94, 1, 0, '2020-03-14 12:51:52', '2020-03-14 12:51:52', 117),
(1277, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 94, 1, 0, '2020-03-14 12:53:48', '2020-03-14 12:53:48', 117),
(1278, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 94, 1, 0, '2020-03-14 13:29:55', '2020-03-14 13:29:55', 117),
(1279, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 94, 1, 0, '2020-03-14 13:30:39', '2020-03-14 13:30:39', 117),
(1280, 'Created new Login History ', 'app\\models\\LoginHistory', 30, 1, 0, '2020-03-14 14:38:02', '2020-03-14 14:38:02', NULL),
(1282, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 95, 1, 0, '2020-03-14 14:38:02', '2020-03-14 14:38:02', 117),
(1283, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 95, 1, 0, '2020-03-14 14:56:01', '2020-03-14 14:56:01', 117),
(1284, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 95, 1, 0, '2020-03-14 14:57:54', '2020-03-14 14:57:54', 117),
(1285, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 95, 1, 0, '2020-03-14 15:04:18', '2020-03-14 15:04:18', 117),
(1287, 'Created new Login History ', 'app\\models\\LoginHistory', 31, 1, 0, '2020-03-14 15:08:21', '2020-03-14 15:08:21', NULL),
(1289, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 96, 1, 0, '2020-03-14 15:08:21', '2020-03-14 15:08:21', 117),
(1307, 'Created new Login History ', 'app\\models\\LoginHistory', 32, 1, 0, '2020-03-14 15:23:51', '2020-03-14 15:23:51', NULL),
(1309, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 97, 1, 0, '2020-03-14 15:23:51', '2020-03-14 15:23:51', 122),
(1310, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 97, 1, 0, '2020-03-14 15:24:59', '2020-03-14 15:24:59', 122),
(1311, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 97, 1, 0, '2020-03-14 15:29:12', '2020-03-14 15:29:12', 122),
(1312, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 97, 1, 0, '2020-03-14 15:56:30', '2020-03-14 15:56:30', 122),
(1313, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 97, 1, 0, '2020-03-14 16:03:58', '2020-03-14 16:03:58', 122),
(1314, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 97, 1, 0, '2020-03-14 16:04:47', '2020-03-14 16:04:47', 122),
(1315, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 97, 1, 0, '2020-03-14 16:05:54', '2020-03-14 16:05:54', 122),
(1316, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 97, 1, 0, '2020-03-14 16:27:02', '2020-03-14 16:27:02', 122),
(1318, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 97, 1, 0, '2020-03-14 16:29:11', '2020-03-14 16:29:11', 122),
(1319, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 97, 1, 0, '2020-03-14 16:36:28', '2020-03-14 16:36:28', 122),
(1320, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 97, 1, 0, '2020-03-14 16:38:43', '2020-03-14 16:38:43', 122),
(1321, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 97, 1, 0, '2020-03-14 17:00:13', '2020-03-14 17:00:13', 122),
(1322, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 97, 1, 0, '2020-03-14 17:04:40', '2020-03-14 17:04:40', 122),
(1323, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 97, 1, 0, '2020-03-14 17:05:44', '2020-03-14 17:05:44', 122),
(1324, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 97, 1, 0, '2020-03-14 17:06:24', '2020-03-14 17:06:24', 122),
(1325, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 97, 1, 0, '2020-03-14 17:07:24', '2020-03-14 17:07:24', 122),
(1326, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 97, 1, 0, '2020-03-14 17:08:00', '2020-03-14 17:08:00', 122),
(1327, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 97, 1, 0, '2020-03-14 17:19:29', '2020-03-14 17:19:29', 122),
(1328, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 97, 1, 0, '2020-03-14 17:21:05', '2020-03-14 17:21:05', 122),
(1329, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 97, 1, 0, '2020-03-14 17:21:57', '2020-03-14 17:21:57', 122),
(1330, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 97, 1, 0, '2020-03-14 17:23:00', '2020-03-14 17:23:00', 122),
(1331, 'Created new Login History ', 'app\\models\\LoginHistory', 33, 1, 0, '2020-03-14 17:24:14', '2020-03-14 17:24:14', NULL),
(1332, 'Created new Login History ', 'app\\models\\LoginHistory', 34, 1, 0, '2020-03-15 11:59:41', '2020-03-15 11:59:41', NULL),
(1333, 'Created new Login History ', 'app\\models\\LoginHistory', 35, 1, 0, '2020-03-15 11:59:59', '2020-03-15 11:59:59', NULL),
(1334, 'Created new Login History ', 'app\\models\\LoginHistory', 36, 1, 0, '2020-03-15 12:00:12', '2020-03-15 12:00:12', NULL),
(1335, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 97, 1, 0, '2020-03-16 09:42:25', '2020-03-16 09:42:25', 122),
(1340, 'Created new Login History ', 'app\\models\\LoginHistory', 37, 1, 0, '2020-03-16 10:16:57', '2020-03-16 10:16:57', NULL),
(1343, 'Created new Login History ', 'app\\models\\LoginHistory', 38, 1, 0, '2020-03-16 10:23:06', '2020-03-16 10:23:06', NULL),
(1344, 'Created new Login History ', 'app\\models\\LoginHistory', 39, 1, 0, '2020-03-16 10:23:18', '2020-03-16 10:23:18', NULL),
(1345, 'Created new Login History ', 'app\\models\\LoginHistory', 40, 1, 0, '2020-03-16 10:23:32', '2020-03-16 10:23:32', NULL),
(1346, 'Created new Login History ', 'app\\models\\LoginHistory', 41, 1, 0, '2020-03-16 10:23:43', '2020-03-16 10:23:43', NULL),
(1347, 'Created new Login History ', 'app\\models\\LoginHistory', 42, 1, 0, '2020-03-16 10:24:25', '2020-03-16 10:24:25', NULL),
(1348, 'Created new Login History ', 'app\\models\\LoginHistory', 43, 1, 0, '2020-03-16 10:24:31', '2020-03-16 10:24:31', NULL),
(1361, 'Created new Login History ', 'app\\models\\LoginHistory', 44, 1, 0, '2020-03-16 11:20:23', '2020-03-16 11:20:23', NULL),
(1363, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 100, 1, 0, '2020-03-16 11:20:23', '2020-03-16 11:20:23', 117),
(1365, 'Created new Login History ', 'app\\models\\LoginHistory', 45, 1, 0, '2020-03-16 11:36:26', '2020-03-16 11:36:26', NULL),
(1367, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 101, 1, 0, '2020-03-16 11:36:26', '2020-03-16 11:36:26', 117),
(1368, 'Created new Login History ', 'app\\models\\LoginHistory', 46, 1, 0, '2020-03-16 12:22:14', '2020-03-16 12:22:14', NULL),
(1369, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 101, 1, 0, '2020-03-16 13:06:12', '2020-03-16 13:06:12', 117),
(1370, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 101, 1, 0, '2020-03-16 13:15:31', '2020-03-16 13:15:31', 117),
(1371, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 101, 1, 0, '2020-03-16 13:19:01', '2020-03-16 13:19:01', 117),
(1372, 'Created new Login History ', 'app\\models\\LoginHistory', 47, 1, 0, '2020-03-16 18:31:16', '2020-03-16 18:31:16', NULL);
INSERT INTO `tbl_feed` (`id`, `content`, `model_type`, `model_id`, `state_id`, `type_id`, `created_on`, `updated_on`, `created_by_id`) VALUES
(1374, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 102, 1, 0, '2020-03-16 18:31:16', '2020-03-16 18:31:16', 117),
(1376, 'Created new Login History ', 'app\\models\\LoginHistory', 48, 1, 0, '2020-03-17 09:18:47', '2020-03-17 09:18:47', NULL),
(1383, 'Created new Login History ', 'app\\models\\LoginHistory', 49, 1, 0, '2020-03-17 09:19:08', '2020-03-17 09:19:08', NULL),
(1385, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 103, 1, 0, '2020-03-17 09:19:08', '2020-03-17 09:19:08', 124),
(1386, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 103, 1, 0, '2020-03-17 09:27:09', '2020-03-17 09:27:09', 124),
(1387, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 103, 1, 0, '2020-03-17 09:32:45', '2020-03-17 09:32:45', 124),
(1388, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 103, 1, 0, '2020-03-17 09:34:09', '2020-03-17 09:34:09', 124),
(1389, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 103, 1, 0, '2020-03-17 09:38:05', '2020-03-17 09:38:05', 124),
(1390, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 103, 1, 0, '2020-03-17 09:49:38', '2020-03-17 09:49:38', 124),
(1397, 'Created new Login History ', 'app\\models\\LoginHistory', 50, 1, 0, '2020-03-17 09:53:05', '2020-03-17 09:53:05', NULL),
(1398, 'Created new Login History ', 'app\\models\\LoginHistory', 51, 1, 0, '2020-03-17 09:53:13', '2020-03-17 09:53:13', NULL),
(1400, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 104, 1, 0, '2020-03-17 09:53:13', '2020-03-17 09:53:13', 125),
(1404, 'Created new Login History ', 'app\\models\\LoginHistory', 52, 1, 0, '2020-03-17 10:03:09', '2020-03-17 10:03:09', NULL),
(1418, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 103, 1, 0, '2020-03-17 10:08:01', '2020-03-17 10:08:01', 124),
(1427, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 103, 1, 0, '2020-03-17 10:20:04', '2020-03-17 10:20:04', 124),
(1428, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 103, 1, 0, '2020-03-17 10:21:13', '2020-03-17 10:21:13', 124),
(1429, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 103, 1, 0, '2020-03-17 10:35:38', '2020-03-17 10:35:38', 124),
(1430, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 103, 1, 0, '2020-03-17 10:37:08', '2020-03-17 10:37:08', 124),
(1432, 'Created new Login History ', 'app\\models\\LoginHistory', 53, 1, 0, '2020-03-17 10:38:32', '2020-03-17 10:38:32', NULL),
(1433, 'Created new Login History ', 'app\\models\\LoginHistory', 54, 1, 0, '2020-03-17 10:38:39', '2020-03-17 10:38:39', NULL),
(1434, 'Created new Login History ', 'app\\models\\LoginHistory', 55, 1, 0, '2020-03-17 10:38:53', '2020-03-17 10:38:53', NULL),
(1435, 'Created new Login History ', 'app\\models\\LoginHistory', 56, 1, 0, '2020-03-17 10:39:09', '2020-03-17 10:39:09', NULL),
(1436, 'Created new Login History ', 'app\\models\\LoginHistory', 57, 1, 0, '2020-03-17 10:39:15', '2020-03-17 10:39:15', NULL),
(1437, 'Created new Login History ', 'app\\models\\LoginHistory', 58, 1, 0, '2020-03-17 10:40:23', '2020-03-17 10:40:23', NULL),
(1438, 'Created new Login History ', 'app\\models\\LoginHistory', 59, 1, 0, '2020-03-17 10:40:38', '2020-03-17 10:40:38', NULL),
(1445, 'Created new Login History ', 'app\\models\\LoginHistory', 60, 1, 0, '2020-03-17 10:42:32', '2020-03-17 10:42:32', NULL),
(1447, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 106, 1, 0, '2020-03-17 10:42:32', '2020-03-17 10:42:32', 127),
(1448, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 103, 1, 0, '2020-03-17 10:43:37', '2020-03-17 10:43:37', 124),
(1449, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 106, 1, 0, '2020-03-17 10:49:19', '2020-03-17 10:49:19', 127),
(1450, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 103, 1, 0, '2020-03-17 10:52:40', '2020-03-17 10:52:40', 124),
(1451, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 103, 1, 0, '2020-03-17 10:59:48', '2020-03-17 10:59:48', 124),
(1457, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 106, 1, 0, '2020-03-17 11:13:51', '2020-03-17 11:13:51', 127),
(1458, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 106, 1, 0, '2020-03-17 11:15:55', '2020-03-17 11:15:55', 127),
(1459, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 106, 1, 0, '2020-03-17 11:21:17', '2020-03-17 11:21:17', 127),
(1460, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 103, 1, 0, '2020-03-17 11:22:53', '2020-03-17 11:22:53', 124),
(1461, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 103, 1, 0, '2020-03-17 11:24:19', '2020-03-17 11:24:19', 124),
(1462, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 103, 1, 0, '2020-03-17 11:27:29', '2020-03-17 11:27:29', 124),
(1463, 'Created new Login History ', 'app\\models\\LoginHistory', 61, 1, 0, '2020-03-17 11:28:18', '2020-03-17 11:28:18', NULL),
(1464, 'Created new Login History ', 'app\\models\\LoginHistory', 62, 1, 0, '2020-03-17 11:28:31', '2020-03-17 11:28:31', NULL),
(1465, 'Created new Login History ', 'app\\models\\LoginHistory', 63, 1, 0, '2020-03-17 11:37:54', '2020-03-17 11:37:54', NULL),
(1467, 'Created new Login History ', 'app\\models\\LoginHistory', 64, 1, 0, '2020-03-17 11:38:41', '2020-03-17 11:38:41', NULL),
(1469, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 107, 1, 0, '2020-03-17 11:38:41', '2020-03-17 11:38:41', 124),
(1470, 'Created new Login History ', 'app\\models\\LoginHistory', 65, 1, 0, '2020-03-17 11:38:58', '2020-03-17 11:38:58', NULL),
(1471, 'Created new Login History ', 'app\\models\\LoginHistory', 66, 1, 0, '2020-03-17 11:39:25', '2020-03-17 11:39:25', NULL),
(1472, 'Created new Login History ', 'app\\models\\LoginHistory', 67, 1, 0, '2020-03-17 11:39:35', '2020-03-17 11:39:35', NULL),
(1473, 'Created new Login History ', 'app\\models\\LoginHistory', 68, 1, 0, '2020-03-17 11:39:56', '2020-03-17 11:39:56', NULL),
(1475, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 108, 1, 0, '2020-03-17 11:39:56', '2020-03-17 11:39:56', 124),
(1476, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 106, 1, 0, '2020-03-17 11:41:43', '2020-03-17 11:41:43', 127),
(1477, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 108, 1, 0, '2020-03-17 11:42:55', '2020-03-17 11:42:55', 124),
(1479, 'Created new Login History ', 'app\\models\\LoginHistory', 69, 1, 0, '2020-03-17 11:45:31', '2020-03-17 11:45:31', NULL),
(1480, 'Created new Login History ', 'app\\models\\LoginHistory', 70, 1, 0, '2020-03-17 11:45:45', '2020-03-17 11:45:45', NULL),
(1482, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 109, 1, 0, '2020-03-17 11:45:46', '2020-03-17 11:45:46', 124),
(1484, 'Created new Login History ', 'app\\models\\LoginHistory', 71, 1, 0, '2020-03-17 11:46:21', '2020-03-17 11:46:21', NULL),
(1486, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 110, 1, 0, '2020-03-17 11:46:21', '2020-03-17 11:46:21', 124),
(1489, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 110, 1, 0, '2020-03-17 11:47:51', '2020-03-17 11:47:51', 124),
(1490, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 110, 1, 0, '2020-03-17 11:48:59', '2020-03-17 11:48:59', 124),
(1491, 'Created new Login History ', 'app\\models\\LoginHistory', 72, 1, 0, '2020-03-17 11:49:17', '2020-03-17 11:49:17', NULL),
(1493, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 110, 1, 0, '2020-03-17 11:50:11', '2020-03-17 11:50:11', 124),
(1497, 'Created new Login History ', 'app\\models\\LoginHistory', 73, 1, 0, '2020-03-17 11:52:58', '2020-03-17 11:52:58', NULL),
(1498, 'Created new Login History ', 'app\\models\\LoginHistory', 74, 1, 0, '2020-03-17 11:53:08', '2020-03-17 11:53:08', NULL),
(1500, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 111, 1, 0, '2020-03-17 11:53:08', '2020-03-17 11:53:08', 124),
(1501, 'Created new Login History ', 'app\\models\\LoginHistory', 75, 1, 0, '2020-03-17 11:55:26', '2020-03-17 11:55:26', NULL),
(1502, 'Created new Login History ', 'app\\models\\LoginHistory', 76, 1, 0, '2020-03-17 11:55:34', '2020-03-17 11:55:34', NULL),
(1504, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 112, 1, 0, '2020-03-17 11:55:34', '2020-03-17 11:55:34', 124),
(1508, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 106, 1, 0, '2020-03-17 11:55:50', '2020-03-17 11:55:50', 127),
(1510, 'Created new Login History ', 'app\\models\\LoginHistory', 77, 1, 0, '2020-03-17 11:56:09', '2020-03-17 11:56:09', NULL),
(1511, 'Created new Login History ', 'app\\models\\LoginHistory', 78, 1, 0, '2020-03-17 11:56:26', '2020-03-17 11:56:26', NULL),
(1512, 'Created new Login History ', 'app\\models\\LoginHistory', 79, 1, 0, '2020-03-17 11:56:30', '2020-03-17 11:56:30', NULL),
(1513, 'Created new Login History ', 'app\\models\\LoginHistory', 80, 1, 0, '2020-03-17 11:56:42', '2020-03-17 11:56:42', NULL),
(1515, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 113, 1, 0, '2020-03-17 11:56:42', '2020-03-17 11:56:42', 125),
(1518, 'Created new Login History ', 'app\\models\\LoginHistory', 81, 1, 0, '2020-03-17 12:01:58', '2020-03-17 12:01:58', NULL),
(1519, 'Created new Login History ', 'app\\models\\LoginHistory', 82, 1, 0, '2020-03-17 12:02:20', '2020-03-17 12:02:20', NULL),
(1521, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 114, 1, 0, '2020-03-17 12:02:20', '2020-03-17 12:02:20', 124),
(1522, 'Created new Login History ', 'app\\models\\LoginHistory', 83, 1, 0, '2020-03-17 12:05:18', '2020-03-17 12:05:18', NULL),
(1523, 'Created new Login History ', 'app\\models\\LoginHistory', 84, 1, 0, '2020-03-17 12:05:28', '2020-03-17 12:05:28', NULL),
(1524, 'Created new Login History ', 'app\\models\\LoginHistory', 85, 1, 0, '2020-03-17 12:05:35', '2020-03-17 12:05:35', NULL),
(1529, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 114, 1, 0, '2020-03-17 12:16:12', '2020-03-17 12:16:12', 124),
(1533, 'Created new Login History ', 'app\\models\\LoginHistory', 86, 1, 0, '2020-03-17 12:21:39', '2020-03-17 12:21:39', NULL),
(1534, 'Created new Login History ', 'app\\models\\LoginHistory', 87, 1, 0, '2020-03-17 12:21:49', '2020-03-17 12:21:49', NULL),
(1536, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 116, 1, 0, '2020-03-17 12:21:49', '2020-03-17 12:21:49', 124),
(1538, 'Created new Login History ', 'app\\models\\LoginHistory', 88, 1, 0, '2020-03-17 12:30:18', '2020-03-17 12:30:18', NULL),
(1540, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 117, 1, 0, '2020-03-17 12:30:18', '2020-03-17 12:30:18', 124),
(1543, 'Created new Login History ', 'app\\models\\LoginHistory', 89, 1, 0, '2020-03-17 12:31:25', '2020-03-17 12:31:25', NULL),
(1544, 'Created new Login History ', 'app\\models\\LoginHistory', 90, 1, 0, '2020-03-17 12:34:10', '2020-03-17 12:34:10', NULL),
(1545, 'Created new Login History ', 'app\\models\\LoginHistory', 91, 1, 0, '2020-03-17 12:34:22', '2020-03-17 12:34:22', NULL),
(1547, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 118, 1, 0, '2020-03-17 12:34:22', '2020-03-17 12:34:22', 124),
(1548, 'Created new Login History ', 'app\\models\\LoginHistory', 92, 1, 0, '2020-03-17 12:35:33', '2020-03-17 12:35:33', NULL),
(1560, 'Created new Login History ', 'app\\models\\LoginHistory', 93, 1, 0, '2020-03-17 13:23:12', '2020-03-17 13:23:12', NULL),
(1572, 'Created new Login History ', 'app\\models\\LoginHistory', 94, 1, 0, '2020-03-17 13:26:58', '2020-03-17 13:26:58', NULL),
(1573, 'Created new Login History ', 'app\\models\\LoginHistory', 95, 1, 0, '2020-03-17 13:27:09', '2020-03-17 13:27:09', NULL),
(1575, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 120, 1, 0, '2020-03-17 13:27:09', '2020-03-17 13:27:09', 130),
(1576, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 120, 1, 0, '2020-03-17 13:38:07', '2020-03-17 13:38:07', 130),
(1577, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 120, 1, 0, '2020-03-17 15:07:51', '2020-03-17 15:07:51', 130),
(1583, 'Created new Login History ', 'app\\models\\LoginHistory', 96, 1, 0, '2020-03-17 15:25:31', '2020-03-17 15:25:31', NULL),
(1585, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 121, 1, 0, '2020-03-17 15:25:31', '2020-03-17 15:25:31', 131),
(1587, 'Created new Login History ', 'app\\models\\LoginHistory', 97, 1, 0, '2020-03-17 15:27:43', '2020-03-17 15:27:43', NULL),
(1589, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 122, 1, 0, '2020-03-17 15:27:43', '2020-03-17 15:27:43', 131),
(1597, 'Created new Login History ', 'app\\models\\LoginHistory', 98, 1, 0, '2020-03-17 15:34:27', '2020-03-17 15:34:27', NULL),
(1598, 'Created new Login History ', 'app\\models\\LoginHistory', 99, 1, 0, '2020-03-17 15:34:43', '2020-03-17 15:34:43', NULL),
(1600, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 123, 1, 0, '2020-03-17 15:34:43', '2020-03-17 15:34:43', 132),
(1610, 'Created new Login History ', 'app\\models\\LoginHistory', 100, 1, 0, '2020-03-17 15:38:14', '2020-03-17 15:38:14', NULL),
(1612, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 124, 1, 0, '2020-03-17 15:38:14', '2020-03-17 15:38:14', 133),
(1614, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 122, 1, 0, '2020-03-17 15:42:42', '2020-03-17 15:42:42', 131),
(1621, 'Created new Login History ', 'app\\models\\LoginHistory', 101, 1, 0, '2020-03-17 15:48:36', '2020-03-17 15:48:36', NULL),
(1623, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 125, 1, 0, '2020-03-17 15:48:36', '2020-03-17 15:48:36', 133),
(1624, 'Created new Login History ', 'app\\models\\LoginHistory', 102, 1, 0, '2020-03-17 15:50:02', '2020-03-17 15:50:02', NULL),
(1626, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 126, 1, 0, '2020-03-17 15:50:02', '2020-03-17 15:50:02', 131),
(1628, 'Created new Login History ', 'app\\models\\LoginHistory', 103, 1, 0, '2020-03-17 16:26:08', '2020-03-17 16:26:08', NULL),
(1629, 'Created new Login History ', 'app\\models\\LoginHistory', 104, 1, 0, '2020-03-17 16:26:17', '2020-03-17 16:26:17', NULL),
(1631, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 127, 1, 0, '2020-03-17 16:26:17', '2020-03-17 16:26:17', 132),
(1632, 'Created new Login History ', 'app\\models\\LoginHistory', 105, 1, 0, '2020-03-17 16:58:42', '2020-03-17 16:58:42', NULL),
(1633, 'Created new Login History ', 'app\\models\\LoginHistory', 106, 1, 0, '2020-03-17 16:58:54', '2020-03-17 16:58:54', NULL),
(1634, 'Created new Login History ', 'app\\models\\LoginHistory', 107, 1, 0, '2020-03-17 16:59:15', '2020-03-17 16:59:15', NULL),
(1636, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 128, 1, 0, '2020-03-17 16:59:15', '2020-03-17 16:59:15', 133),
(1638, 'Created new Login History ', 'app\\models\\LoginHistory', 108, 1, 0, '2020-03-17 17:00:46', '2020-03-17 17:00:46', NULL),
(1639, 'Created new Login History ', 'app\\models\\LoginHistory', 109, 1, 0, '2020-03-17 17:01:11', '2020-03-17 17:01:11', NULL),
(1641, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 129, 1, 0, '2020-03-17 17:01:11', '2020-03-17 17:01:11', 131),
(1642, 'Created new Login History ', 'app\\models\\LoginHistory', 110, 1, 0, '2020-03-17 17:03:32', '2020-03-17 17:03:32', NULL),
(1643, 'Created new Login History ', 'app\\models\\LoginHistory', 111, 1, 0, '2020-03-17 17:03:44', '2020-03-17 17:03:44', NULL),
(1645, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 130, 1, 0, '2020-03-17 17:03:44', '2020-03-17 17:03:44', 133),
(1646, 'Created new Login History ', 'app\\models\\LoginHistory', 112, 1, 0, '2020-03-17 17:07:44', '2020-03-17 17:07:44', NULL),
(1647, 'Created new Login History ', 'app\\models\\LoginHistory', 113, 1, 0, '2020-03-17 17:07:53', '2020-03-17 17:07:53', NULL),
(1648, 'Created new Login History ', 'app\\models\\LoginHistory', 114, 1, 0, '2020-03-17 17:08:07', '2020-03-17 17:08:07', NULL),
(1650, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 131, 1, 0, '2020-03-17 17:08:07', '2020-03-17 17:08:07', 132),
(1651, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 131, 1, 0, '2020-03-17 17:08:42', '2020-03-17 17:08:42', 132),
(1652, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 129, 1, 0, '2020-03-17 17:16:38', '2020-03-17 17:16:38', 131),
(1653, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 129, 1, 0, '2020-03-17 17:18:37', '2020-03-17 17:18:37', 131),
(1654, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 129, 1, 0, '2020-03-17 17:19:12', '2020-03-17 17:19:12', 131),
(1655, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 129, 1, 0, '2020-03-17 17:31:37', '2020-03-17 17:31:37', 131),
(1656, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 129, 1, 0, '2020-03-17 17:33:01', '2020-03-17 17:33:01', 131),
(1658, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 129, 1, 0, '2020-03-17 17:36:29', '2020-03-17 17:36:29', 131),
(1660, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 130, 1, 0, '2020-03-17 17:37:12', '2020-03-17 17:37:12', 133),
(1665, 'Created new Login History ', 'app\\models\\LoginHistory', 115, 1, 0, '2020-03-17 17:44:01', '2020-03-17 17:44:01', NULL),
(1667, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 132, 1, 0, '2020-03-17 17:44:01', '2020-03-17 17:44:01', 132),
(1674, 'Created new Login History ', 'app\\models\\LoginHistory', 116, 1, 0, '2020-03-17 17:48:02', '2020-03-17 17:48:02', NULL),
(1680, 'Created new Login History ', 'app\\models\\LoginHistory', 117, 1, 0, '2020-03-17 17:51:16', '2020-03-17 17:51:16', NULL),
(1681, 'Created new Login History ', 'app\\models\\LoginHistory', 118, 1, 0, '2020-03-17 17:51:28', '2020-03-17 17:51:28', NULL),
(1682, 'Created new Login History ', 'app\\models\\LoginHistory', 119, 1, 0, '2020-03-17 17:51:38', '2020-03-17 17:51:38', NULL),
(1684, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 134, 1, 0, '2020-03-17 17:51:38', '2020-03-17 17:51:38', 132),
(1685, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 134, 1, 0, '2020-03-17 17:56:53', '2020-03-17 17:56:53', 132),
(1690, 'Created new Login History ', 'app\\models\\LoginHistory', 120, 1, 0, '2020-03-17 18:01:59', '2020-03-17 18:01:59', NULL),
(1699, 'Created new Login History ', 'app\\models\\LoginHistory', 121, 1, 0, '2020-03-17 18:15:23', '2020-03-17 18:15:23', NULL),
(1702, 'Created new Login History ', 'app\\models\\LoginHistory', 122, 1, 0, '2020-03-17 18:26:19', '2020-03-17 18:26:19', NULL),
(1711, 'Created new Login History ', 'app\\models\\LoginHistory', 123, 1, 0, '2020-03-17 18:38:33', '2020-03-17 18:38:33', NULL),
(1713, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 138, 1, 0, '2020-03-17 18:38:33', '2020-03-17 18:38:33', 131),
(1714, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 138, 1, 0, '2020-03-17 18:38:59', '2020-03-17 18:38:59', 131),
(1721, 'Created new Login History ', 'app\\models\\LoginHistory', 124, 1, 0, '2020-03-17 18:40:56', '2020-03-17 18:40:56', NULL),
(1724, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 138, 1, 0, '2020-03-17 18:44:33', '2020-03-17 18:44:33', 131),
(1725, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 138, 1, 0, '2020-03-17 18:44:50', '2020-03-17 18:44:50', 131),
(1727, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 138, 1, 0, '2020-03-17 18:46:31', '2020-03-17 18:46:31', 131),
(1728, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 138, 1, 0, '2020-03-17 18:47:37', '2020-03-17 18:47:37', 131),
(1729, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 138, 1, 0, '2020-03-17 18:51:48', '2020-03-17 18:51:48', 131),
(1730, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 138, 1, 0, '2020-03-17 18:54:05', '2020-03-17 18:54:05', 131),
(1731, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 138, 1, 0, '2020-03-17 18:57:10', '2020-03-17 18:57:10', 131),
(1732, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 138, 1, 0, '2020-03-17 18:59:18', '2020-03-17 18:59:18', 131),
(1733, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 138, 1, 0, '2020-03-17 18:59:30', '2020-03-17 18:59:30', 131),
(1735, 'Created new Login History ', 'app\\models\\LoginHistory', 125, 1, 0, '2020-03-17 19:00:18', '2020-03-17 19:00:18', NULL),
(1743, 'Created new Login History ', 'app\\models\\LoginHistory', 126, 1, 0, '2020-03-17 19:01:22', '2020-03-17 19:01:22', NULL),
(1745, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 141, 1, 0, '2020-03-17 19:01:22', '2020-03-17 19:01:22', 142),
(1752, 'Created new Login History ', 'app\\models\\LoginHistory', 127, 1, 0, '2020-03-17 19:03:40', '2020-03-17 19:03:40', NULL),
(1754, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 142, 1, 0, '2020-03-17 19:03:40', '2020-03-17 19:03:40', 143),
(1761, 'Created new Login History ', 'app\\models\\LoginHistory', 128, 1, 0, '2020-03-17 19:10:50', '2020-03-17 19:10:50', NULL),
(1763, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 143, 1, 0, '2020-03-17 19:10:50', '2020-03-17 19:10:50', 144),
(1764, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 143, 1, 0, '2020-03-17 19:11:01', '2020-03-17 19:11:01', 144),
(1769, 'Created new Login History ', 'app\\models\\LoginHistory', 129, 1, 0, '2020-03-17 19:16:38', '2020-03-17 19:16:38', NULL),
(1771, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 144, 1, 0, '2020-03-17 19:16:38', '2020-03-17 19:16:38', 145),
(1773, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 143, 1, 0, '2020-03-17 19:19:04', '2020-03-17 19:19:04', 144),
(1774, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 143, 1, 0, '2020-03-17 19:19:12', '2020-03-17 19:19:12', 144),
(1776, 'Created new Login History ', 'app\\models\\LoginHistory', 130, 1, 0, '2020-03-17 19:19:26', '2020-03-17 19:19:26', NULL),
(1778, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 145, 1, 0, '2020-03-17 19:19:26', '2020-03-17 19:19:26', 143),
(1787, 'Created new Login History ', 'app\\models\\LoginHistory', 131, 1, 0, '2020-03-17 19:37:36', '2020-03-17 19:37:36', NULL),
(1789, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 146, 1, 0, '2020-03-17 19:37:36', '2020-03-17 19:37:36', 146),
(1795, 'Created new Login History ', 'app\\models\\LoginHistory', 132, 1, 0, '2020-03-17 19:41:05', '2020-03-17 19:41:05', NULL),
(1797, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 147, 1, 0, '2020-03-17 19:41:05', '2020-03-17 19:41:05', 147),
(1799, 'Created new User ', 'app\\models\\User', 148, 1, 0, '2020-03-17 19:48:34', '2020-03-17 19:48:34', NULL),
(1800, 'Created new User Wallet ', 'app\\models\\UserWallet', 133, 1, 0, '2020-03-17 19:48:34', '2020-03-17 19:48:34', NULL),
(1801, 'Created new Patient Medical Information ', 'app\\models\\PatientMedicalInformation', 128, 1, 0, '2020-03-17 19:48:34', '2020-03-17 19:48:34', NULL),
(1802, 'Created new Patientsymptom ', 'app\\models\\Patientsymptom', 230, 1, 0, '2020-03-17 19:48:34', '2020-03-17 19:48:34', NULL),
(1803, 'Created new Patientsymptom ', 'app\\models\\Patientsymptom', 231, 1, 0, '2020-03-17 19:48:34', '2020-03-17 19:48:34', NULL),
(1804, 'Created new Login History ', 'app\\models\\LoginHistory', 133, 1, 0, '2020-03-17 19:49:04', '2020-03-17 19:49:04', NULL),
(1805, 'Modified User ', 'app\\models\\User', 148, 1, 0, '2020-03-17 19:49:04', '2020-03-17 19:49:04', 148),
(1806, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 148, 1, 0, '2020-03-17 19:49:04', '2020-03-17 19:49:04', 148),
(1811, 'Created new Login History ', 'app\\models\\LoginHistory', 134, 1, 0, '2020-03-17 20:04:00', '2020-03-17 20:04:00', NULL),
(1813, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 149, 1, 0, '2020-03-17 20:04:00', '2020-03-17 20:04:00', 149),
(1814, 'Created new User ', 'app\\models\\User', 150, 1, 0, '2020-03-17 20:42:21', '2020-03-17 20:42:21', NULL),
(1815, 'Created new Workprofile ', 'app\\models\\Workprofile', 15, 1, 0, '2020-03-17 20:42:21', '2020-03-17 20:42:21', NULL),
(1819, 'Created new Login History ', 'app\\models\\LoginHistory', 135, 1, 0, '2020-03-17 20:42:53', '2020-03-17 20:42:53', NULL),
(1820, 'Modified User ', 'app\\models\\User', 150, 1, 0, '2020-03-17 20:42:53', '2020-03-17 20:42:53', 150),
(1821, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 150, 1, 0, '2020-03-17 20:42:53', '2020-03-17 20:42:53', 150),
(1822, 'Modified User ', 'app\\models\\User', 150, 1, 0, '2020-03-17 20:45:31', '2020-03-17 20:45:31', NULL),
(1823, 'Created new User ', 'app\\models\\User', 151, 1, 0, '2020-03-17 22:03:56', '2020-03-17 22:03:56', NULL),
(1824, 'Created new User Wallet ', 'app\\models\\UserWallet', 134, 1, 0, '2020-03-17 22:03:56', '2020-03-17 22:03:56', NULL),
(1825, 'Created new Patient Medical Information ', 'app\\models\\PatientMedicalInformation', 129, 1, 0, '2020-03-17 22:03:56', '2020-03-17 22:03:56', NULL),
(1826, 'Created new Patientsymptom ', 'app\\models\\Patientsymptom', 232, 1, 0, '2020-03-17 22:03:56', '2020-03-17 22:03:56', NULL),
(1827, 'Created new Login History ', 'app\\models\\LoginHistory', 136, 1, 0, '2020-03-17 22:04:59', '2020-03-17 22:04:59', NULL),
(1828, 'Modified User ', 'app\\models\\User', 151, 1, 0, '2020-03-17 22:04:59', '2020-03-17 22:04:59', 151),
(1829, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 151, 1, 0, '2020-03-17 22:04:59', '2020-03-17 22:04:59', 151),
(1830, 'Created new User ', 'app\\models\\User', 152, 1, 0, '2020-03-17 22:22:39', '2020-03-17 22:22:39', NULL),
(1831, 'Created new Workprofile ', 'app\\models\\Workprofile', 16, 1, 0, '2020-03-17 22:22:39', '2020-03-17 22:22:39', NULL),
(1835, 'Created new Login History ', 'app\\models\\LoginHistory', 137, 1, 0, '2020-03-17 22:23:49', '2020-03-17 22:23:49', NULL),
(1836, 'Modified User ', 'app\\models\\User', 152, 1, 0, '2020-03-17 22:23:49', '2020-03-17 22:23:49', 152),
(1837, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 152, 1, 0, '2020-03-17 22:23:49', '2020-03-17 22:23:49', 152),
(1838, 'Created new User ', 'app\\models\\User', 153, 1, 0, '2020-03-17 23:43:51', '2020-03-17 23:43:51', NULL),
(1839, 'Created new User Wallet ', 'app\\models\\UserWallet', 135, 1, 0, '2020-03-17 23:43:51', '2020-03-17 23:43:51', NULL),
(1840, 'Created new Patient Medical Information ', 'app\\models\\PatientMedicalInformation', 130, 1, 0, '2020-03-17 23:43:51', '2020-03-17 23:43:51', NULL),
(1841, 'Created new Patientsymptom ', 'app\\models\\Patientsymptom', 233, 1, 0, '2020-03-17 23:43:51', '2020-03-17 23:43:51', NULL),
(1842, 'Created new Patientsymptom ', 'app\\models\\Patientsymptom', 234, 1, 0, '2020-03-17 23:43:51', '2020-03-17 23:43:51', NULL),
(1843, 'Created new Patientsymptom ', 'app\\models\\Patientsymptom', 235, 1, 0, '2020-03-17 23:43:51', '2020-03-17 23:43:51', NULL),
(1844, 'Created new Login History ', 'app\\models\\LoginHistory', 138, 1, 0, '2020-03-17 23:44:06', '2020-03-17 23:44:06', NULL),
(1845, 'Modified User ', 'app\\models\\User', 153, 1, 0, '2020-03-17 23:44:06', '2020-03-17 23:44:06', 153),
(1846, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 153, 1, 0, '2020-03-17 23:44:06', '2020-03-17 23:44:06', 153),
(1847, 'Modified User ', 'app\\models\\User', 153, 1, 0, '2020-03-17 23:44:52', '2020-03-17 23:44:52', 153),
(1848, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 152, 1, 0, '2020-03-18 02:46:52', '2020-03-18 02:46:52', 152),
(1849, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 153, 1, 0, '2020-03-18 02:51:20', '2020-03-18 02:51:20', 153),
(1850, 'Created new Login History ', 'app\\models\\LoginHistory', 139, 1, 0, '2020-03-18 03:51:57', '2020-03-18 03:51:57', NULL),
(1851, 'Created new Login History ', 'app\\models\\LoginHistory', 140, 1, 0, '2020-03-18 03:52:22', '2020-03-18 03:52:22', NULL),
(1852, 'Created new Login History ', 'app\\models\\LoginHistory', 141, 1, 0, '2020-03-18 03:52:38', '2020-03-18 03:52:38', NULL),
(1853, 'Created new Login History ', 'app\\models\\LoginHistory', 142, 1, 0, '2020-03-18 04:13:25', '2020-03-18 04:13:25', NULL),
(1854, 'Created new Login History ', 'app\\models\\LoginHistory', 143, 1, 0, '2020-03-18 04:16:15', '2020-03-18 04:16:15', NULL),
(1855, 'Created new Login History ', 'app\\models\\LoginHistory', 144, 1, 0, '2020-03-18 04:18:49', '2020-03-18 04:18:49', NULL),
(1856, 'Created new Login History ', 'app\\models\\LoginHistory', 145, 1, 0, '2020-03-18 09:25:06', '2020-03-18 09:25:06', NULL),
(1857, 'Created new Login History ', 'app\\models\\LoginHistory', 146, 1, 0, '2020-03-18 12:42:09', '2020-03-18 12:42:09', NULL),
(1858, 'Created new Login History ', 'app\\models\\LoginHistory', 147, 1, 0, '2020-03-18 12:42:20', '2020-03-18 12:42:20', NULL),
(1859, 'Created new Login History ', 'app\\models\\LoginHistory', 148, 1, 0, '2020-03-18 12:44:10', '2020-03-18 12:44:10', NULL),
(1861, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 154, 1, 0, '2020-03-18 12:44:10', '2020-03-18 12:44:10', 149),
(1862, 'Created new Login History ', 'app\\models\\LoginHistory', 149, 1, 0, '2020-03-18 12:45:31', '2020-03-18 12:45:31', NULL),
(1865, 'Created new User ', 'app\\models\\User', 154, 1, 0, '2020-03-18 12:51:44', '2020-03-18 12:51:44', NULL),
(1866, 'Created new Workprofile ', 'app\\models\\Workprofile', 17, 1, 0, '2020-03-18 12:51:44', '2020-03-18 12:51:44', NULL),
(1869, 'Created new Login History ', 'app\\models\\LoginHistory', 150, 1, 0, '2020-03-18 12:52:10', '2020-03-18 12:52:10', NULL),
(1870, 'Modified User ', 'app\\models\\User', 154, 1, 0, '2020-03-18 12:52:11', '2020-03-18 12:52:11', 154),
(1871, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 156, 1, 0, '2020-03-18 12:52:11', '2020-03-18 12:52:11', 154),
(1877, 'Created new Login History ', 'app\\models\\LoginHistory', 151, 1, 0, '2020-03-18 12:52:31', '2020-03-18 12:52:31', NULL),
(1880, 'Modified User ', 'app\\models\\User', 154, 1, 0, '2020-03-18 12:55:51', '2020-03-18 12:55:51', NULL),
(1890, 'Created new Login History ', 'app\\models\\LoginHistory', 152, 1, 0, '2020-03-18 13:03:31', '2020-03-18 13:03:31', NULL),
(1899, 'Created new Login History ', 'app\\models\\LoginHistory', 153, 1, 0, '2020-03-18 13:40:55', '2020-03-18 13:40:55', NULL),
(1902, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 151, 1, 0, '2020-03-18 14:43:26', '2020-03-18 14:43:26', 151),
(1903, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 151, 1, 0, '2020-03-18 14:43:55', '2020-03-18 14:43:55', 151),
(1904, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 152, 1, 0, '2020-03-18 15:24:36', '2020-03-18 15:24:36', 152),
(1905, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 152, 1, 0, '2020-03-18 17:34:44', '2020-03-18 17:34:44', 152),
(1906, 'Modified User ', 'app\\models\\User', 152, 1, 0, '2020-03-18 17:34:52', '2020-03-18 17:34:52', NULL),
(1911, 'Created new Login History ', 'app\\models\\LoginHistory', 154, 1, 0, '2020-03-18 17:41:02', '2020-03-18 17:41:02', NULL),
(1917, 'Created new Login History ', 'app\\models\\LoginHistory', 155, 1, 0, '2020-03-18 17:46:29', '2020-03-18 17:46:29', NULL),
(1919, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 160, 1, 0, '2020-03-18 17:46:29', '2020-03-18 17:46:29', 164),
(1920, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 148, 1, 0, '2020-03-18 17:59:20', '2020-03-18 17:59:20', 148),
(1921, 'Created new Login History ', 'app\\models\\LoginHistory', 156, 1, 0, '2020-03-18 18:08:49', '2020-03-18 18:08:49', NULL),
(1922, 'Modified User ', 'app\\models\\User', 154, 1, 0, '2020-03-18 18:08:49', '2020-03-18 18:08:49', 154),
(1923, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 161, 1, 0, '2020-03-18 18:08:49', '2020-03-18 18:08:49', 154),
(1927, 'Modified User ', 'app\\models\\User', 154, 1, 0, '2020-03-18 18:15:24', '2020-03-18 18:15:24', NULL),
(1928, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 160, 1, 0, '2020-03-18 19:44:08', '2020-03-18 19:44:08', 164),
(1929, 'Created new Login History ', 'app\\models\\LoginHistory', 157, 1, 0, '2020-03-18 21:45:31', '2020-03-18 21:45:31', NULL),
(1930, 'Modified User ', 'app\\models\\User', 150, 1, 0, '2020-03-18 21:45:31', '2020-03-18 21:45:31', 150),
(1931, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 162, 1, 0, '2020-03-18 21:45:31', '2020-03-18 21:45:31', 150),
(1932, 'Created new Login History ', 'app\\models\\LoginHistory', 158, 1, 0, '2020-03-19 10:23:18', '2020-03-19 10:23:18', NULL),
(1942, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 160, 1, 0, '2020-03-22 23:43:13', '2020-03-22 23:43:13', 164),
(1944, 'Created new Login History ', 'app\\models\\LoginHistory', 159, 1, 0, '2020-03-24 09:54:10', '2020-03-24 09:54:10', NULL),
(1945, 'Created new Login History ', 'app\\models\\LoginHistory', 160, 1, 0, '2020-03-24 09:54:17', '2020-03-24 09:54:17', NULL),
(1949, 'Created new Login History ', 'app\\models\\LoginHistory', 161, 1, 0, '2020-03-24 10:41:09', '2020-03-24 10:41:09', NULL),
(1952, 'Created new User ', 'app\\models\\User', 170, 1, 0, '2020-03-24 10:51:39', '2020-03-24 10:51:39', NULL),
(1953, 'Created new Workprofile ', 'app\\models\\Workprofile', 28, 1, 0, '2020-03-24 10:51:39', '2020-03-24 10:51:39', NULL),
(1955, 'Created new Login History ', 'app\\models\\LoginHistory', 162, 1, 0, '2020-03-24 10:51:52', '2020-03-24 10:51:52', NULL),
(1956, 'Modified User ', 'app\\models\\User', 170, 1, 0, '2020-03-24 10:51:52', '2020-03-24 10:51:52', 170),
(1957, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 164, 1, 0, '2020-03-24 10:51:52', '2020-03-24 10:51:52', 170),
(1963, 'Created new Login History ', 'app\\models\\LoginHistory', 163, 1, 0, '2020-03-24 11:06:32', '2020-03-24 11:06:32', NULL),
(1965, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 165, 1, 0, '2020-03-24 11:06:33', '2020-03-24 11:06:33', 171),
(1966, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 165, 1, 0, '2020-03-24 11:43:35', '2020-03-24 11:43:35', 171),
(1967, 'Created new Login History ', 'app\\models\\LoginHistory', 164, 1, 0, '2020-03-24 12:00:21', '2020-03-24 12:00:21', NULL),
(1969, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 166, 1, 0, '2020-03-24 12:00:21', '2020-03-24 12:00:21', 171),
(1970, 'Created new Login History ', 'app\\models\\LoginHistory', 165, 1, 0, '2020-03-24 12:57:30', '2020-03-24 12:57:30', NULL),
(1976, 'Created new Login History ', 'app\\models\\LoginHistory', 166, 1, 0, '2020-03-24 14:24:14', '2020-03-24 14:24:14', NULL),
(1977, 'Created new Login History ', 'app\\models\\LoginHistory', 167, 1, 0, '2020-03-24 14:24:25', '2020-03-24 14:24:25', NULL),
(1979, 'Modified Category ', 'app\\models\\Category', 1, 1, 0, '2020-03-24 14:41:00', '2020-03-24 14:41:00', 1),
(1982, 'Created new User ', 'app\\models\\User', 172, 1, 0, '2020-03-24 14:44:37', '2020-03-24 14:44:37', 1),
(1983, 'Created new Workprofile ', 'app\\models\\Workprofile', 29, 1, 0, '2020-03-24 14:44:37', '2020-03-24 14:44:37', 1),
(1984, 'Created new Doctorspecialization ', 'app\\models\\Doctorspecialization', 68, 1, 0, '2020-03-24 14:44:37', '2020-03-24 14:44:37', 1),
(1996, 'Created new Login History ', 'app\\models\\LoginHistory', 168, 1, 0, '2020-03-24 15:29:11', '2020-03-24 15:29:11', NULL),
(1998, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 168, 1, 0, '2020-03-24 15:29:11', '2020-03-24 15:29:11', 173),
(2006, 'Created new Login History ', 'app\\models\\LoginHistory', 169, 1, 0, '2020-03-24 15:34:38', '2020-03-24 15:34:38', NULL),
(2023, 'Created new Login History ', 'app\\models\\LoginHistory', 170, 1, 0, '2020-03-24 17:39:01', '2020-03-24 17:39:01', NULL),
(2026, 'Created new User ', 'app\\models\\User', 176, 1, 0, '2020-03-24 23:48:32', '2020-03-24 23:48:32', NULL),
(2027, 'Created new User Wallet ', 'app\\models\\UserWallet', 140, 1, 0, '2020-03-24 23:48:32', '2020-03-24 23:48:32', NULL),
(2028, 'Created new Patient Medical Information ', 'app\\models\\PatientMedicalInformation', 135, 1, 0, '2020-03-24 23:48:32', '2020-03-24 23:48:32', NULL),
(2029, 'Created new Patientsymptom ', 'app\\models\\Patientsymptom', 238, 1, 0, '2020-03-24 23:48:32', '2020-03-24 23:48:32', NULL),
(2030, 'Created new Login History ', 'app\\models\\LoginHistory', 171, 1, 0, '2020-03-24 23:49:09', '2020-03-24 23:49:09', NULL),
(2031, 'Modified User ', 'app\\models\\User', 176, 1, 0, '2020-03-24 23:49:09', '2020-03-24 23:49:09', 176),
(2032, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 171, 1, 0, '2020-03-24 23:49:09', '2020-03-24 23:49:09', 176),
(2033, 'Created new Login History ', 'app\\models\\LoginHistory', 172, 1, 0, '2020-03-25 09:29:01', '2020-03-25 09:29:01', NULL),
(2042, 'Created new Login History ', 'app\\models\\LoginHistory', 173, 1, 0, '2020-03-25 09:33:21', '2020-03-25 09:33:21', NULL),
(2044, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 172, 1, 0, '2020-03-25 09:33:21', '2020-03-25 09:33:21', 177),
(2045, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 172, 1, 0, '2020-03-25 09:38:31', '2020-03-25 09:38:31', 177),
(2046, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 172, 1, 0, '2020-03-25 09:43:04', '2020-03-25 09:43:04', 177),
(2047, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 172, 1, 0, '2020-03-25 10:04:48', '2020-03-25 10:04:48', 177),
(2048, 'Created new Login History ', 'app\\models\\LoginHistory', 174, 1, 0, '2020-03-25 10:10:49', '2020-03-25 10:10:49', NULL),
(2049, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 172, 1, 0, '2020-03-25 10:23:27', '2020-03-25 10:23:27', 177),
(2050, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 172, 1, 0, '2020-03-25 10:33:34', '2020-03-25 10:33:34', 177),
(2051, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 172, 1, 0, '2020-03-25 11:16:33', '2020-03-25 11:16:33', 177),
(2052, 'Created new Login History ', 'app\\models\\LoginHistory', 175, 1, 0, '2020-03-25 11:19:23', '2020-03-25 11:19:23', NULL),
(2054, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 173, 1, 0, '2020-03-25 11:19:23', '2020-03-25 11:19:23', 177),
(2055, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 173, 1, 0, '2020-03-25 11:24:22', '2020-03-25 11:24:22', 177),
(2056, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 173, 1, 0, '2020-03-25 11:27:11', '2020-03-25 11:27:11', 177),
(2057, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 173, 1, 0, '2020-03-25 11:29:57', '2020-03-25 11:29:57', 177),
(2058, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 173, 1, 0, '2020-03-25 11:31:10', '2020-03-25 11:31:10', 177),
(2059, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 173, 1, 0, '2020-03-25 11:41:10', '2020-03-25 11:41:10', 177),
(2060, 'Created new Login History ', 'app\\models\\LoginHistory', 176, 1, 0, '2020-03-25 11:43:34', '2020-03-25 11:43:34', NULL),
(2063, 'Modified Category ', 'app\\models\\Category', 4, 1, 0, '2020-03-25 11:45:07', '2020-03-25 11:45:07', 1),
(2064, 'Modified Category ', 'app\\models\\Category', 3, 1, 0, '2020-03-25 11:45:43', '2020-03-25 11:45:43', 1),
(2065, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 173, 1, 0, '2020-03-25 11:46:30', '2020-03-25 11:46:30', 177),
(2066, 'Modified Category ', 'app\\models\\Category', 2, 1, 0, '2020-03-25 11:47:08', '2020-03-25 11:47:08', 1),
(2067, 'Modified Category ', 'app\\models\\Category', 1, 1, 0, '2020-03-25 11:49:08', '2020-03-25 11:49:08', 1),
(2068, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 173, 1, 0, '2020-03-25 11:52:49', '2020-03-25 11:52:49', 177),
(2078, 'Created new Doctorprofessionalstatus ', 'app\\models\\Doctorprofessionalstatus', 3, 1, 0, '2020-03-25 12:01:52', '2020-03-25 12:01:52', 1),
(2079, 'Created new Category Question ', 'app\\models\\CategoryQuestion', 1, 1, 0, '2020-03-25 12:05:10', '2020-03-25 12:05:10', 1),
(2080, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 173, 1, 0, '2020-03-25 12:14:40', '2020-03-25 12:14:40', 177),
(2081, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 173, 1, 0, '2020-03-25 12:17:38', '2020-03-25 12:17:38', 177),
(2083, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 173, 1, 0, '2020-03-25 12:25:21', '2020-03-25 12:25:21', 177),
(2084, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 173, 1, 0, '2020-03-25 12:26:53', '2020-03-25 12:26:53', 177),
(2086, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 173, 1, 0, '2020-03-25 12:35:45', '2020-03-25 12:35:45', 177),
(2087, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 173, 1, 0, '2020-03-25 12:41:13', '2020-03-25 12:41:13', 177),
(2088, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 173, 1, 0, '2020-03-25 12:42:46', '2020-03-25 12:42:46', 177),
(2090, 'Created new Login History ', 'app\\models\\LoginHistory', 177, 1, 0, '2020-03-25 15:07:24', '2020-03-25 15:07:24', NULL),
(2092, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 174, 1, 0, '2020-03-25 15:07:24', '2020-03-25 15:07:24', 177),
(2093, 'Created new Login History ', 'app\\models\\LoginHistory', 178, 1, 0, '2020-03-25 15:07:44', '2020-03-25 15:07:44', NULL),
(2095, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 175, 1, 0, '2020-03-25 15:07:44', '2020-03-25 15:07:44', 177),
(2096, 'Created new Login History ', 'app\\models\\LoginHistory', 179, 1, 0, '2020-03-25 15:08:20', '2020-03-25 15:08:20', NULL),
(2098, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 176, 1, 0, '2020-03-25 15:08:20', '2020-03-25 15:08:20', 177),
(2099, 'Created new Login History ', 'app\\models\\LoginHistory', 180, 1, 0, '2020-03-25 15:14:00', '2020-03-25 15:14:00', NULL),
(2101, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 177, 1, 0, '2020-03-25 15:14:00', '2020-03-25 15:14:00', 177),
(2102, 'Created new Login History ', 'app\\models\\LoginHistory', 181, 1, 0, '2020-03-25 15:17:46', '2020-03-25 15:17:46', NULL),
(2104, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 178, 1, 0, '2020-03-25 15:17:46', '2020-03-25 15:17:46', 177),
(2105, 'Created new Login History ', 'app\\models\\LoginHistory', 182, 1, 0, '2020-03-25 15:18:49', '2020-03-25 15:18:49', NULL),
(2107, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 179, 1, 0, '2020-03-25 15:18:49', '2020-03-25 15:18:49', 177),
(2108, 'Created new Login History ', 'app\\models\\LoginHistory', 183, 1, 0, '2020-03-25 15:19:26', '2020-03-25 15:19:26', NULL),
(2110, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 180, 1, 0, '2020-03-25 15:19:26', '2020-03-25 15:19:26', 177),
(2111, 'Created new Login History ', 'app\\models\\LoginHistory', 184, 1, 0, '2020-03-25 15:21:43', '2020-03-25 15:21:43', NULL),
(2121, 'Created new Login History ', 'app\\models\\LoginHistory', 185, 1, 0, '2020-03-25 15:34:31', '2020-03-25 15:34:31', NULL),
(2124, 'Created new User ', 'app\\models\\User', 179, 1, 0, '2020-03-25 15:47:41', '2020-03-25 15:47:41', NULL),
(2125, 'Created new User Wallet ', 'app\\models\\UserWallet', 142, 1, 0, '2020-03-25 15:47:41', '2020-03-25 15:47:41', NULL),
(2126, 'Created new Patient Medical Information ', 'app\\models\\PatientMedicalInformation', 137, 1, 0, '2020-03-25 15:47:41', '2020-03-25 15:47:41', NULL),
(2127, 'Created new Patientsymptom ', 'app\\models\\Patientsymptom', 244, 1, 0, '2020-03-25 15:47:41', '2020-03-25 15:47:41', NULL),
(2128, 'Created new Patientsymptom ', 'app\\models\\Patientsymptom', 245, 1, 0, '2020-03-25 15:47:41', '2020-03-25 15:47:41', NULL),
(2129, 'Created new Login History ', 'app\\models\\LoginHistory', 186, 1, 0, '2020-03-25 15:47:55', '2020-03-25 15:47:55', NULL),
(2130, 'Modified User ', 'app\\models\\User', 179, 1, 0, '2020-03-25 15:47:55', '2020-03-25 15:47:55', 179),
(2131, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 183, 1, 0, '2020-03-25 15:47:55', '2020-03-25 15:47:55', 179),
(2132, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 183, 1, 0, '2020-03-25 15:50:54', '2020-03-25 15:50:54', 179),
(2133, 'Created new Login History ', 'app\\models\\LoginHistory', 187, 1, 0, '2020-03-25 15:58:34', '2020-03-25 15:58:34', NULL),
(2134, 'Created new User ', 'app\\models\\User', 180, 1, 0, '2020-03-25 16:41:44', '2020-03-25 16:41:44', NULL),
(2135, 'Created new User Wallet ', 'app\\models\\UserWallet', 143, 1, 0, '2020-03-25 16:41:44', '2020-03-25 16:41:44', NULL),
(2136, 'Created new Patient Medical Information ', 'app\\models\\PatientMedicalInformation', 138, 1, 0, '2020-03-25 16:41:44', '2020-03-25 16:41:44', NULL),
(2137, 'Created new Patientsymptom ', 'app\\models\\Patientsymptom', 246, 1, 0, '2020-03-25 16:41:44', '2020-03-25 16:41:44', NULL),
(2138, 'Created new Login History ', 'app\\models\\LoginHistory', 188, 1, 0, '2020-03-25 16:42:01', '2020-03-25 16:42:01', NULL),
(2139, 'Created new Login History ', 'app\\models\\LoginHistory', 189, 1, 0, '2020-03-25 16:42:12', '2020-03-25 16:42:12', NULL),
(2140, 'Modified User ', 'app\\models\\User', 180, 1, 0, '2020-03-25 16:42:12', '2020-03-25 16:42:12', 180),
(2141, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 184, 1, 0, '2020-03-25 16:42:12', '2020-03-25 16:42:12', 180),
(2142, 'Created new Rating ', 'app\\modules\\rating\\models\\Rating', 4, 1, 0, '2020-03-25 16:43:58', '2020-03-25 16:43:58', 180),
(2143, 'Modified User ', 'app\\models\\User', 180, 1, 0, '2020-03-25 16:47:36', '2020-03-25 16:47:36', 180),
(2150, 'Created new Login History ', 'app\\models\\LoginHistory', 190, 1, 0, '2020-03-25 16:55:16', '2020-03-25 16:55:16', NULL),
(2152, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 185, 1, 0, '2020-03-25 16:55:16', '2020-03-25 16:55:16', 181),
(2154, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 183, 1, 0, '2020-03-25 17:58:06', '2020-03-25 17:58:06', 179),
(2155, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 183, 1, 0, '2020-03-25 18:02:20', '2020-03-25 18:02:20', 179),
(2156, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 183, 1, 0, '2020-03-25 18:11:07', '2020-03-25 18:11:07', 179),
(2157, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 183, 1, 0, '2020-03-25 18:18:55', '2020-03-25 18:18:55', 179),
(2158, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 183, 1, 0, '2020-03-25 18:21:34', '2020-03-25 18:21:34', 179),
(2159, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 183, 1, 0, '2020-03-25 18:23:22', '2020-03-25 18:23:22', 179),
(2160, 'Created new User ', 'app\\models\\User', 182, 1, 0, '2020-03-25 19:02:05', '2020-03-25 19:02:05', NULL),
(2161, 'Created new User Wallet ', 'app\\models\\UserWallet', 144, 1, 0, '2020-03-25 19:02:05', '2020-03-25 19:02:05', NULL),
(2162, 'Created new Patient Medical Information ', 'app\\models\\PatientMedicalInformation', 139, 1, 0, '2020-03-25 19:02:05', '2020-03-25 19:02:05', NULL),
(2163, 'Created new Patientsymptom ', 'app\\models\\Patientsymptom', 247, 1, 0, '2020-03-25 19:02:05', '2020-03-25 19:02:05', NULL),
(2164, 'Created new Patientsymptom ', 'app\\models\\Patientsymptom', 248, 1, 0, '2020-03-25 19:02:05', '2020-03-25 19:02:05', NULL),
(2165, 'Created new Login History ', 'app\\models\\LoginHistory', 191, 1, 0, '2020-03-25 19:02:39', '2020-03-25 19:02:39', NULL),
(2166, 'Modified User ', 'app\\models\\User', 182, 1, 0, '2020-03-25 19:02:39', '2020-03-25 19:02:39', 182),
(2167, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 186, 1, 0, '2020-03-25 19:02:39', '2020-03-25 19:02:39', 182),
(2168, 'Created new Login History ', 'app\\models\\LoginHistory', 192, 1, 0, '2020-03-25 19:36:03', '2020-03-25 19:36:03', NULL),
(2169, 'Created new Login History ', 'app\\models\\LoginHistory', 193, 1, 0, '2020-03-25 19:36:27', '2020-03-25 19:36:27', NULL),
(2174, 'Created new Login History ', 'app\\models\\LoginHistory', 194, 1, 0, '2020-03-25 20:06:03', '2020-03-25 20:06:03', NULL),
(2178, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 151, 1, 0, '2020-03-25 20:15:20', '2020-03-25 20:15:20', 151),
(2179, 'Created new Rating ', 'app\\modules\\rating\\models\\Rating', 5, 1, 0, '2020-03-25 20:16:03', '2020-03-25 20:16:03', 151),
(2180, 'Created new Rating ', 'app\\modules\\rating\\models\\Rating', 6, 1, 0, '2020-03-25 20:17:05', '2020-03-25 20:17:05', 151),
(2182, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 151, 1, 0, '2020-03-25 20:29:47', '2020-03-25 20:29:47', 151),
(2183, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 171, 1, 0, '2020-03-25 20:38:13', '2020-03-25 20:38:13', 176);
INSERT INTO `tbl_feed` (`id`, `content`, `model_type`, `model_id`, `state_id`, `type_id`, `created_on`, `updated_on`, `created_by_id`) VALUES
(2185, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 151, 1, 0, '2020-03-25 21:47:58', '2020-03-25 21:47:58', 151),
(2187, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 153, 1, 0, '2020-03-26 01:35:04', '2020-03-26 01:35:04', 153),
(2188, 'Created new Rating ', 'app\\modules\\rating\\models\\Rating', 7, 1, 0, '2020-03-26 01:36:28', '2020-03-26 01:36:28', 153),
(2189, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 153, 1, 0, '2020-03-26 01:39:21', '2020-03-26 01:39:21', 153),
(2193, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 153, 1, 0, '2020-03-26 02:25:00', '2020-03-26 02:25:00', 153),
(2194, 'Created new User ', 'app\\models\\User', 184, 1, 0, '2020-03-26 10:35:32', '2020-03-26 10:35:32', NULL),
(2195, 'Created new User Wallet ', 'app\\models\\UserWallet', 145, 1, 0, '2020-03-26 10:35:32', '2020-03-26 10:35:32', NULL),
(2196, 'Created new Patient Medical Information ', 'app\\models\\PatientMedicalInformation', 140, 1, 0, '2020-03-26 10:35:32', '2020-03-26 10:35:32', NULL),
(2197, 'Created new Patientsymptom ', 'app\\models\\Patientsymptom', 249, 1, 0, '2020-03-26 10:35:32', '2020-03-26 10:35:32', NULL),
(2198, 'Created new Patientsymptom ', 'app\\models\\Patientsymptom', 250, 1, 0, '2020-03-26 10:35:32', '2020-03-26 10:35:32', NULL),
(2199, 'Created new Patientsymptom ', 'app\\models\\Patientsymptom', 251, 1, 0, '2020-03-26 10:35:32', '2020-03-26 10:35:32', NULL),
(2200, 'Created new Login History ', 'app\\models\\LoginHistory', 195, 1, 0, '2020-03-26 10:35:38', '2020-03-26 10:35:38', NULL),
(2201, 'Modified User ', 'app\\models\\User', 184, 1, 0, '2020-03-26 10:35:38', '2020-03-26 10:35:38', 184),
(2202, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 188, 1, 0, '2020-03-26 10:35:38', '2020-03-26 10:35:38', 184),
(2203, 'Created new Rating ', 'app\\modules\\rating\\models\\Rating', 8, 1, 0, '2020-03-26 10:35:50', '2020-03-26 10:35:50', 184),
(2204, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 188, 1, 0, '2020-03-26 10:53:35', '2020-03-26 10:53:35', 184),
(2205, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 188, 1, 0, '2020-03-26 11:06:38', '2020-03-26 11:06:38', 184),
(2206, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 183, 1, 0, '2020-03-26 11:06:45', '2020-03-26 11:06:45', 179),
(2208, 'Created new Login History ', 'app\\models\\LoginHistory', 196, 1, 0, '2020-03-26 11:14:08', '2020-03-26 11:14:08', NULL),
(2209, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 183, 1, 0, '2020-03-26 11:20:50', '2020-03-26 11:20:50', 179),
(2210, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 183, 1, 0, '2020-03-26 11:35:02', '2020-03-26 11:35:02', 179),
(2211, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 183, 1, 0, '2020-03-26 11:45:28', '2020-03-26 11:45:28', 179),
(2212, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 183, 1, 0, '2020-03-26 11:46:54', '2020-03-26 11:46:54', 179),
(2213, 'Created new Category Question ', 'app\\models\\CategoryQuestion', 2, 1, 0, '2020-03-26 11:48:19', '2020-03-26 11:48:19', 1),
(2214, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 183, 1, 0, '2020-03-26 11:49:34', '2020-03-26 11:49:34', 179),
(2215, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 188, 1, 0, '2020-03-26 12:24:53', '2020-03-26 12:24:53', 184),
(2216, 'Created new Login History ', 'app\\models\\LoginHistory', 197, 1, 0, '2020-03-26 12:26:17', '2020-03-26 12:26:17', NULL),
(2217, 'Modified User ', 'app\\models\\User', 179, 1, 0, '2020-03-26 12:26:17', '2020-03-26 12:26:17', 179),
(2218, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 189, 1, 0, '2020-03-26 12:26:17', '2020-03-26 12:26:17', 179),
(2219, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 188, 1, 0, '2020-03-26 12:27:25', '2020-03-26 12:27:25', 184),
(2220, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 189, 1, 0, '2020-03-26 12:32:37', '2020-03-26 12:32:37', 179),
(2221, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 188, 1, 0, '2020-03-26 12:43:15', '2020-03-26 12:43:15', 184),
(2227, 'Created new Login History ', 'app\\models\\LoginHistory', 198, 1, 0, '2020-03-26 13:24:24', '2020-03-26 13:24:24', NULL),
(2230, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 188, 1, 0, '2020-03-26 13:24:38', '2020-03-26 13:24:38', 184),
(2231, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 188, 1, 0, '2020-03-26 13:29:48', '2020-03-26 13:29:48', 184),
(2232, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 188, 1, 0, '2020-03-26 13:32:37', '2020-03-26 13:32:37', 184),
(2233, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 188, 1, 0, '2020-03-26 13:34:00', '2020-03-26 13:34:00', 184),
(2234, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 188, 1, 0, '2020-03-26 13:38:23', '2020-03-26 13:38:23', 184),
(2235, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 188, 1, 0, '2020-03-26 13:39:16', '2020-03-26 13:39:16', 184),
(2236, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 188, 1, 0, '2020-03-26 13:41:01', '2020-03-26 13:41:01', 184),
(2237, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 188, 1, 0, '2020-03-26 13:42:04', '2020-03-26 13:42:04', 184),
(2238, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 188, 1, 0, '2020-03-26 13:44:14', '2020-03-26 13:44:14', 184),
(2239, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 188, 1, 0, '2020-03-26 13:51:10', '2020-03-26 13:51:10', 184),
(2240, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 188, 1, 0, '2020-03-26 13:53:39', '2020-03-26 13:53:39', 184),
(2241, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 188, 1, 0, '2020-03-26 13:54:15', '2020-03-26 13:54:15', 184),
(2243, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 151, 1, 0, '2020-03-26 13:55:48', '2020-03-26 13:55:48', 151),
(2247, 'Created new Login History ', 'app\\models\\LoginHistory', 199, 1, 0, '2020-03-26 15:19:40', '2020-03-26 15:19:40', NULL),
(2248, 'Created new Login History ', 'app\\models\\LoginHistory', 200, 1, 0, '2020-03-26 15:19:51', '2020-03-26 15:19:51', NULL),
(2251, 'Created new User ', 'app\\models\\User', 187, 1, 0, '2020-03-26 15:25:47', '2020-03-26 15:25:47', NULL),
(2252, 'Created new User Wallet ', 'app\\models\\UserWallet', 146, 1, 0, '2020-03-26 15:25:47', '2020-03-26 15:25:47', NULL),
(2253, 'Created new Patient Medical Information ', 'app\\models\\PatientMedicalInformation', 141, 1, 0, '2020-03-26 15:25:47', '2020-03-26 15:25:47', NULL),
(2254, 'Created new Patientsymptom ', 'app\\models\\Patientsymptom', 252, 1, 0, '2020-03-26 15:25:47', '2020-03-26 15:25:47', NULL),
(2255, 'Created new Login History ', 'app\\models\\LoginHistory', 201, 1, 0, '2020-03-26 15:26:25', '2020-03-26 15:26:25', NULL),
(2256, 'Modified User ', 'app\\models\\User', 187, 1, 0, '2020-03-26 15:26:25', '2020-03-26 15:26:25', 187),
(2257, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 192, 1, 0, '2020-03-26 15:26:25', '2020-03-26 15:26:25', 187),
(2258, 'Created new Login History ', 'app\\models\\LoginHistory', 202, 1, 0, '2020-03-26 15:28:00', '2020-03-26 15:28:00', NULL),
(2259, 'Modified User ', 'app\\models\\User', 179, 1, 0, '2020-03-26 15:28:00', '2020-03-26 15:28:00', 179),
(2260, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-26 15:28:00', '2020-03-26 15:28:00', 179),
(2261, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-26 15:28:43', '2020-03-26 15:28:43', 179),
(2263, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-26 15:30:34', '2020-03-26 15:30:34', 179),
(2264, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-26 15:44:09', '2020-03-26 15:44:09', 179),
(2265, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-26 15:45:54', '2020-03-26 15:45:54', 179),
(2266, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-26 15:46:30', '2020-03-26 15:46:30', 179),
(2267, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 192, 1, 0, '2020-03-26 15:54:27', '2020-03-26 15:54:27', 187),
(2268, 'Created new Rating ', 'app\\modules\\rating\\models\\Rating', 9, 1, 0, '2020-03-26 15:54:55', '2020-03-26 15:54:55', 187),
(2269, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-26 15:56:09', '2020-03-26 15:56:09', 179),
(2270, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-26 15:56:41', '2020-03-26 15:56:41', 179),
(2271, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-26 15:59:01', '2020-03-26 15:59:01', 179),
(2272, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-26 16:02:56', '2020-03-26 16:02:56', 179),
(2273, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-26 16:05:45', '2020-03-26 16:05:45', 179),
(2274, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-26 16:07:36', '2020-03-26 16:07:36', 179),
(2275, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-26 16:08:57', '2020-03-26 16:08:57', 179),
(2276, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-26 16:11:20', '2020-03-26 16:11:20', 179),
(2277, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-26 16:16:25', '2020-03-26 16:16:25', 179),
(2278, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-26 16:17:50', '2020-03-26 16:17:50', 179),
(2279, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-26 16:19:50', '2020-03-26 16:19:50', 179),
(2280, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-26 16:20:15', '2020-03-26 16:20:15', 179),
(2281, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-26 16:22:10', '2020-03-26 16:22:10', 179),
(2282, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-26 16:22:57', '2020-03-26 16:22:57', 179),
(2284, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-26 16:33:38', '2020-03-26 16:33:38', 179),
(2285, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-26 16:36:59', '2020-03-26 16:36:59', 179),
(2286, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-26 16:37:42', '2020-03-26 16:37:42', 179),
(2287, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-26 16:38:09', '2020-03-26 16:38:09', 179),
(2288, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-26 17:20:40', '2020-03-26 17:20:40', 179),
(2289, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-26 17:24:56', '2020-03-26 17:24:56', 179),
(2290, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-26 17:25:43', '2020-03-26 17:25:43', 179),
(2291, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-26 18:02:48', '2020-03-26 18:02:48', 179),
(2292, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-26 18:15:32', '2020-03-26 18:15:32', 179),
(2293, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 151, 1, 0, '2020-03-26 21:22:35', '2020-03-26 21:22:35', 151),
(2294, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 151, 1, 0, '2020-03-26 21:25:07', '2020-03-26 21:25:07', 151),
(2295, 'Modified User ', 'app\\models\\User', 151, 1, 0, '2020-03-26 21:25:13', '2020-03-26 21:25:13', NULL),
(2296, 'Created new User ', 'app\\models\\User', 188, 1, 0, '2020-03-26 21:28:24', '2020-03-26 21:28:24', NULL),
(2297, 'Created new User Wallet ', 'app\\models\\UserWallet', 147, 1, 0, '2020-03-26 21:28:24', '2020-03-26 21:28:24', NULL),
(2298, 'Created new Patient Medical Information ', 'app\\models\\PatientMedicalInformation', 142, 1, 0, '2020-03-26 21:28:24', '2020-03-26 21:28:24', NULL),
(2299, 'Created new Patientsymptom ', 'app\\models\\Patientsymptom', 253, 1, 0, '2020-03-26 21:28:24', '2020-03-26 21:28:24', NULL),
(2300, 'Created new Patientsymptom ', 'app\\models\\Patientsymptom', 254, 1, 0, '2020-03-26 21:28:24', '2020-03-26 21:28:24', NULL),
(2301, 'Created new Patientsymptom ', 'app\\models\\Patientsymptom', 255, 1, 0, '2020-03-26 21:28:24', '2020-03-26 21:28:24', NULL),
(2306, 'Created new Login History ', 'app\\models\\LoginHistory', 203, 1, 0, '2020-03-26 21:40:06', '2020-03-26 21:40:06', NULL),
(2309, 'Created new User ', 'app\\models\\User', 190, 1, 0, '2020-03-26 21:50:09', '2020-03-26 21:50:09', NULL),
(2310, 'Created new User Wallet ', 'app\\models\\UserWallet', 148, 1, 0, '2020-03-26 21:50:09', '2020-03-26 21:50:09', NULL),
(2311, 'Created new Patient Medical Information ', 'app\\models\\PatientMedicalInformation', 143, 1, 0, '2020-03-26 21:50:09', '2020-03-26 21:50:09', NULL),
(2312, 'Created new Patientsymptom ', 'app\\models\\Patientsymptom', 256, 1, 0, '2020-03-26 21:50:09', '2020-03-26 21:50:09', NULL),
(2313, 'Created new Patientsymptom ', 'app\\models\\Patientsymptom', 257, 1, 0, '2020-03-26 21:50:09', '2020-03-26 21:50:09', NULL),
(2314, 'Created new Login History ', 'app\\models\\LoginHistory', 204, 1, 0, '2020-03-26 21:51:33', '2020-03-26 21:51:33', NULL),
(2315, 'Modified User ', 'app\\models\\User', 190, 1, 0, '2020-03-26 21:51:33', '2020-03-26 21:51:33', 190),
(2316, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 195, 1, 0, '2020-03-26 21:51:33', '2020-03-26 21:51:33', 190),
(2317, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 195, 1, 0, '2020-03-27 08:14:59', '2020-03-27 08:14:59', 190),
(2318, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 195, 1, 0, '2020-03-27 08:20:08', '2020-03-27 08:20:08', 190),
(2319, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 195, 1, 0, '2020-03-27 08:22:12', '2020-03-27 08:22:12', 190),
(2321, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 153, 1, 0, '2020-03-27 10:27:56', '2020-03-27 10:27:56', 153),
(2322, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 153, 1, 0, '2020-03-27 10:37:27', '2020-03-27 10:37:27', 153),
(2326, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 195, 1, 0, '2020-03-27 11:03:45', '2020-03-27 11:03:45', 190),
(2327, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 195, 1, 0, '2020-03-27 11:04:00', '2020-03-27 11:04:00', 190),
(2328, 'Modified User ', 'app\\models\\User', 153, 1, 0, '2020-03-27 11:06:21', '2020-03-27 11:06:21', NULL),
(2329, 'Created new Login History ', 'app\\models\\LoginHistory', 205, 1, 0, '2020-03-27 11:08:10', '2020-03-27 11:08:10', NULL),
(2330, 'Created new Login History ', 'app\\models\\LoginHistory', 206, 1, 0, '2020-03-27 11:08:25', '2020-03-27 11:08:25', NULL),
(2331, 'Created new Login History ', 'app\\models\\LoginHistory', 207, 1, 0, '2020-03-27 11:08:39', '2020-03-27 11:08:39', NULL),
(2332, 'Modified User ', 'app\\models\\User', 153, 1, 0, '2020-03-27 11:08:39', '2020-03-27 11:08:39', 153),
(2333, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 196, 1, 0, '2020-03-27 11:08:39', '2020-03-27 11:08:39', 153),
(2335, 'Created new Login History ', 'app\\models\\LoginHistory', 208, 1, 0, '2020-03-27 11:38:14', '2020-03-27 11:38:14', NULL),
(2336, 'Modified User ', 'app\\models\\User', 184, 1, 0, '2020-03-27 11:38:14', '2020-03-27 11:38:14', 184),
(2337, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 197, 1, 0, '2020-03-27 11:38:14', '2020-03-27 11:38:14', 184),
(2338, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 197, 1, 0, '2020-03-27 11:45:45', '2020-03-27 11:45:45', 184),
(2339, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 197, 1, 0, '2020-03-27 11:46:42', '2020-03-27 11:46:42', 184),
(2340, 'Modified User ', 'app\\models\\User', 184, 1, 0, '2020-03-27 11:49:41', '2020-03-27 11:49:41', NULL),
(2341, 'Created new Login History ', 'app\\models\\LoginHistory', 209, 1, 0, '2020-03-27 11:49:49', '2020-03-27 11:49:49', NULL),
(2342, 'Modified User ', 'app\\models\\User', 184, 1, 0, '2020-03-27 11:49:49', '2020-03-27 11:49:49', 184),
(2343, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 198, 1, 0, '2020-03-27 11:49:49', '2020-03-27 11:49:49', 184),
(2344, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 198, 1, 0, '2020-03-27 12:33:17', '2020-03-27 12:33:17', 184),
(2345, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 198, 1, 0, '2020-03-27 12:34:57', '2020-03-27 12:34:57', 184),
(2346, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 198, 1, 0, '2020-03-27 12:35:59', '2020-03-27 12:35:59', 184),
(2347, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 198, 1, 0, '2020-03-27 12:40:38', '2020-03-27 12:40:38', 184),
(2348, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 198, 1, 0, '2020-03-27 12:41:17', '2020-03-27 12:41:17', 184),
(2349, 'Created new Login History ', 'app\\models\\LoginHistory', 210, 1, 0, '2020-03-27 12:43:01', '2020-03-27 12:43:01', NULL),
(2350, 'Created new Login History ', 'app\\models\\LoginHistory', 211, 1, 0, '2020-03-27 14:59:42', '2020-03-27 14:59:42', NULL),
(2352, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 199, 1, 0, '2020-03-27 14:59:42', '2020-03-27 14:59:42', 173),
(2365, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-27 16:33:25', '2020-03-27 16:33:25', 179),
(2380, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-27 16:44:02', '2020-03-27 16:44:02', 179),
(2381, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-27 16:49:08', '2020-03-27 16:49:08', 179),
(2382, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-27 16:55:51', '2020-03-27 16:55:51', 179),
(2383, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-27 16:56:53', '2020-03-27 16:56:53', 179),
(2384, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-27 16:57:38', '2020-03-27 16:57:38', 179),
(2385, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-27 17:01:07', '2020-03-27 17:01:07', 179),
(2386, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-27 17:01:54', '2020-03-27 17:01:54', 179),
(2387, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-27 17:03:36', '2020-03-27 17:03:36', 179),
(2388, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-27 17:03:59', '2020-03-27 17:03:59', 179),
(2389, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-27 17:05:33', '2020-03-27 17:05:33', 179),
(2390, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-27 17:06:11', '2020-03-27 17:06:11', 179),
(2391, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-27 17:06:49', '2020-03-27 17:06:49', 179),
(2392, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-27 17:08:34', '2020-03-27 17:08:34', 179),
(2393, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-27 17:09:03', '2020-03-27 17:09:03', 179),
(2394, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-27 17:09:43', '2020-03-27 17:09:43', 179),
(2395, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-27 17:12:23', '2020-03-27 17:12:23', 179),
(2396, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-27 17:13:37', '2020-03-27 17:13:37', 179),
(2397, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-27 17:14:09', '2020-03-27 17:14:09', 179),
(2398, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-27 17:14:54', '2020-03-27 17:14:54', 179),
(2399, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-27 17:16:09', '2020-03-27 17:16:09', 179),
(2400, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-27 17:16:28', '2020-03-27 17:16:28', 179),
(2401, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-27 17:16:55', '2020-03-27 17:16:55', 179),
(2402, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-27 17:17:57', '2020-03-27 17:17:57', 179),
(2403, 'Created new Category ', 'app\\models\\Category', 19, 1, 0, '2020-03-27 17:41:49', '2020-03-27 17:41:49', 1),
(2404, 'Created new Category ', 'app\\models\\Category', 20, 1, 0, '2020-03-27 17:45:00', '2020-03-27 17:45:00', 1),
(2405, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-27 17:48:17', '2020-03-27 17:48:17', 179),
(2406, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-27 17:52:53', '2020-03-27 17:52:53', 179),
(2407, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-27 17:54:17', '2020-03-27 17:54:17', 179),
(2408, 'Created new Login History ', 'app\\models\\LoginHistory', 212, 1, 0, '2020-03-30 09:58:47', '2020-03-30 09:58:47', NULL),
(2409, 'Modified User ', 'app\\models\\User', 184, 1, 0, '2020-03-30 09:58:47', '2020-03-30 09:58:47', 184),
(2410, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 200, 1, 0, '2020-03-30 09:58:47', '2020-03-30 09:58:47', 184),
(2411, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 200, 1, 0, '2020-03-30 10:00:57', '2020-03-30 10:00:57', 184),
(2412, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-30 10:19:33', '2020-03-30 10:19:33', 179),
(2413, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-30 10:25:45', '2020-03-30 10:25:45', 179),
(2414, 'Created new Login History ', 'app\\models\\LoginHistory', 213, 1, 0, '2020-03-30 10:59:11', '2020-03-30 10:59:11', NULL),
(2415, 'Created new Login History ', 'app\\models\\LoginHistory', 214, 1, 0, '2020-03-30 10:59:20', '2020-03-30 10:59:20', NULL),
(2416, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 200, 1, 0, '2020-03-30 11:19:45', '2020-03-30 11:19:45', 184),
(2420, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-30 11:31:45', '2020-03-30 11:31:45', 179),
(2421, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-30 11:33:41', '2020-03-30 11:33:41', 179),
(2422, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 200, 1, 0, '2020-03-30 11:35:00', '2020-03-30 11:35:00', 184),
(2423, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 200, 1, 0, '2020-03-30 11:42:16', '2020-03-30 11:42:16', 184),
(2424, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 200, 1, 0, '2020-03-30 11:44:02', '2020-03-30 11:44:02', 184),
(2425, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 200, 1, 0, '2020-03-30 12:39:49', '2020-03-30 12:39:49', 184),
(2426, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 200, 1, 0, '2020-03-30 12:45:10', '2020-03-30 12:45:10', 184),
(2427, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 200, 1, 0, '2020-03-30 12:49:59', '2020-03-30 12:49:59', 184),
(2428, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 200, 1, 0, '2020-03-30 12:51:49', '2020-03-30 12:51:49', 184),
(2429, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 200, 1, 0, '2020-03-30 13:02:48', '2020-03-30 13:02:48', 184),
(2430, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-30 13:19:57', '2020-03-30 13:19:57', 179),
(2431, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-30 13:20:01', '2020-03-30 13:20:01', 179),
(2432, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-30 13:21:37', '2020-03-30 13:21:37', 179),
(2433, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-30 13:22:50', '2020-03-30 13:22:50', 179),
(2434, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-30 13:24:00', '2020-03-30 13:24:00', 179),
(2435, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 200, 1, 0, '2020-03-30 13:24:13', '2020-03-30 13:24:13', 184),
(2436, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-30 13:25:31', '2020-03-30 13:25:31', 179),
(2437, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-30 13:33:24', '2020-03-30 13:33:24', 179),
(2438, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-30 13:33:29', '2020-03-30 13:33:29', 179),
(2439, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-30 13:36:32', '2020-03-30 13:36:32', 179),
(2440, 'Created new Login History ', 'app\\models\\LoginHistory', 215, 1, 0, '2020-03-30 13:40:14', '2020-03-30 13:40:14', NULL),
(2442, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 201, 1, 0, '2020-03-30 13:40:14', '2020-03-30 13:40:14', 173),
(2443, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 200, 1, 0, '2020-03-30 13:46:23', '2020-03-30 13:46:23', 184),
(2445, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 200, 1, 0, '2020-03-30 13:54:54', '2020-03-30 13:54:54', 184),
(2446, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 200, 1, 0, '2020-03-30 14:02:03', '2020-03-30 14:02:03', 184),
(2447, 'Created new Sub Category ', 'app\\models\\SubCategory', 1, 1, 0, '2020-03-30 14:16:54', '2020-03-30 14:16:54', 1),
(2448, 'Created new Illness ', 'app\\models\\Illness', 3, 1, 0, '2020-03-30 14:17:54', '2020-03-30 14:17:54', 1),
(2449, 'Created new Illness ', 'app\\models\\Illness', 4, 1, 0, '2020-03-30 14:18:09', '2020-03-30 14:18:09', 1),
(2450, 'Created new Sub Category ', 'app\\models\\SubCategory', 2, 1, 0, '2020-03-30 14:20:46', '2020-03-30 14:20:46', 1),
(2451, 'Created new Illness ', 'app\\models\\Illness', 5, 1, 0, '2020-03-30 14:21:10', '2020-03-30 14:21:10', 1),
(2452, 'Created new Illness ', 'app\\models\\Illness', 6, 1, 0, '2020-03-30 14:21:36', '2020-03-30 14:21:36', 1),
(2460, 'Created new Login History ', 'app\\models\\LoginHistory', 216, 1, 0, '2020-03-30 14:48:20', '2020-03-30 14:48:20', NULL),
(2462, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 202, 1, 0, '2020-03-30 14:48:20', '2020-03-30 14:48:20', 195),
(2463, 'Created new Login History ', 'app\\models\\LoginHistory', 217, 1, 0, '2020-03-30 14:48:38', '2020-03-30 14:48:38', NULL),
(2465, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 203, 1, 0, '2020-03-30 14:48:38', '2020-03-30 14:48:38', 173),
(2466, 'Created new Login History ', 'app\\models\\LoginHistory', 218, 1, 0, '2020-03-30 14:49:26', '2020-03-30 14:49:26', NULL),
(2468, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-30 14:49:26', '2020-03-30 14:49:26', 173),
(2469, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-30 15:16:28', '2020-03-30 15:16:28', 173),
(2470, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-30 15:17:29', '2020-03-30 15:17:29', 173),
(2471, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-30 15:18:09', '2020-03-30 15:18:09', 173),
(2472, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-30 15:34:38', '2020-03-30 15:34:38', 173),
(2473, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-30 15:38:35', '2020-03-30 15:38:35', 173),
(2474, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-30 15:38:52', '2020-03-30 15:38:52', 173),
(2475, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-30 15:40:00', '2020-03-30 15:40:00', 173),
(2476, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-30 15:42:41', '2020-03-30 15:42:41', 173),
(2477, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 200, 1, 0, '2020-03-30 15:44:31', '2020-03-30 15:44:31', 184),
(2478, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-30 15:47:23', '2020-03-30 15:47:23', 173),
(2479, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-30 15:48:19', '2020-03-30 15:48:19', 173),
(2480, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 200, 1, 0, '2020-03-30 15:59:56', '2020-03-30 15:59:56', 184),
(2481, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 200, 1, 0, '2020-03-30 16:01:09', '2020-03-30 16:01:09', 184),
(2482, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-30 16:07:10', '2020-03-30 16:07:10', 173),
(2485, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-30 16:09:30', '2020-03-30 16:09:30', 173),
(2488, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 200, 1, 0, '2020-03-30 16:29:26', '2020-03-30 16:29:26', 184),
(2489, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-30 16:35:37', '2020-03-30 16:35:37', 179),
(2490, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-30 16:37:01', '2020-03-30 16:37:01', 173),
(2493, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 200, 1, 0, '2020-03-30 16:37:10', '2020-03-30 16:37:10', 184),
(2494, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 200, 1, 0, '2020-03-30 16:39:53', '2020-03-30 16:39:53', 184),
(2495, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 200, 1, 0, '2020-03-30 16:49:24', '2020-03-30 16:49:24', 184),
(2496, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 200, 1, 0, '2020-03-30 16:51:38', '2020-03-30 16:51:38', 184),
(2497, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 200, 1, 0, '2020-03-30 16:53:49', '2020-03-30 16:53:49', 184),
(2498, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 200, 1, 0, '2020-03-30 17:05:41', '2020-03-30 17:05:41', 184),
(2499, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-30 17:14:28', '2020-03-30 17:14:28', 179),
(2500, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-30 17:27:44', '2020-03-30 17:27:44', 179),
(2501, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-30 17:36:04', '2020-03-30 17:36:04', 173),
(2502, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-30 17:53:55', '2020-03-30 17:53:55', 179),
(2503, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-30 17:58:33', '2020-03-30 17:58:33', 173),
(2504, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-30 17:58:47', '2020-03-30 17:58:47', 173),
(2505, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-30 18:00:55', '2020-03-30 18:00:55', 173),
(2506, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-30 18:02:35', '2020-03-30 18:02:35', 173),
(2507, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-30 18:16:10', '2020-03-30 18:16:10', 173),
(2508, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-30 18:21:13', '2020-03-30 18:21:13', 173),
(2509, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-30 18:22:27', '2020-03-30 18:22:27', 173),
(2510, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-30 18:27:50', '2020-03-30 18:27:50', 173),
(2511, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 200, 1, 0, '2020-03-30 20:07:54', '2020-03-30 20:07:54', 184),
(2512, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 200, 1, 0, '2020-03-30 20:15:03', '2020-03-30 20:15:03', 184),
(2513, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 200, 1, 0, '2020-03-30 20:18:40', '2020-03-30 20:18:40', 184),
(2514, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 200, 1, 0, '2020-03-31 09:19:16', '2020-03-31 09:19:16', 184),
(2515, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 200, 1, 0, '2020-03-31 09:47:07', '2020-03-31 09:47:07', 184),
(2516, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 200, 1, 0, '2020-03-31 09:58:23', '2020-03-31 09:58:23', 184),
(2517, 'Created new Login History ', 'app\\models\\LoginHistory', 219, 1, 0, '2020-03-31 10:02:30', '2020-03-31 10:02:30', NULL),
(2518, 'Modified User ', 'app\\models\\User', 184, 1, 0, '2020-03-31 10:02:30', '2020-03-31 10:02:30', 184),
(2519, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 205, 1, 0, '2020-03-31 10:02:30', '2020-03-31 10:02:30', 184),
(2520, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 205, 1, 0, '2020-03-31 10:04:20', '2020-03-31 10:04:20', 184),
(2521, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 205, 1, 0, '2020-03-31 10:05:32', '2020-03-31 10:05:32', 184),
(2522, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 205, 1, 0, '2020-03-31 10:10:11', '2020-03-31 10:10:11', 184),
(2523, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 205, 1, 0, '2020-03-31 10:11:37', '2020-03-31 10:11:37', 184),
(2524, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 205, 1, 0, '2020-03-31 10:19:07', '2020-03-31 10:19:07', 184),
(2525, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-31 10:51:56', '2020-03-31 10:51:56', 173),
(2526, 'Created new Login History ', 'app\\models\\LoginHistory', 220, 1, 0, '2020-03-31 10:54:38', '2020-03-31 10:54:38', NULL),
(2528, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 206, 1, 0, '2020-03-31 10:54:38', '2020-03-31 10:54:38', 195),
(2529, 'Created new Login History ', 'app\\models\\LoginHistory', 221, 1, 0, '2020-03-31 11:01:06', '2020-03-31 11:01:06', NULL),
(2530, 'Modified User ', 'app\\models\\User', 184, 1, 0, '2020-03-31 11:01:06', '2020-03-31 11:01:06', 184),
(2531, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 207, 1, 0, '2020-03-31 11:01:06', '2020-03-31 11:01:06', 184),
(2532, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 207, 1, 0, '2020-03-31 11:04:46', '2020-03-31 11:04:46', 184),
(2533, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 207, 1, 0, '2020-03-31 11:09:17', '2020-03-31 11:09:17', 184),
(2534, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 207, 1, 0, '2020-03-31 11:10:30', '2020-03-31 11:10:30', 184),
(2535, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 207, 1, 0, '2020-03-31 11:12:54', '2020-03-31 11:12:54', 184),
(2536, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 207, 1, 0, '2020-03-31 11:13:20', '2020-03-31 11:13:20', 184),
(2537, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 207, 1, 0, '2020-03-31 11:17:40', '2020-03-31 11:17:40', 184),
(2538, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 206, 1, 0, '2020-03-31 11:19:31', '2020-03-31 11:19:31', 195),
(2539, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 206, 1, 0, '2020-03-31 11:20:41', '2020-03-31 11:20:41', 195),
(2540, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 207, 1, 0, '2020-03-31 11:25:14', '2020-03-31 11:25:14', 184),
(2541, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 207, 1, 0, '2020-03-31 11:31:52', '2020-03-31 11:31:52', 184),
(2542, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 207, 1, 0, '2020-03-31 11:32:31', '2020-03-31 11:32:31', 184),
(2543, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 206, 1, 0, '2020-03-31 11:33:57', '2020-03-31 11:33:57', 195),
(2544, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 207, 1, 0, '2020-03-31 11:34:27', '2020-03-31 11:34:27', 184),
(2545, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 207, 1, 0, '2020-03-31 11:36:24', '2020-03-31 11:36:24', 184),
(2546, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 206, 1, 0, '2020-03-31 11:38:51', '2020-03-31 11:38:51', 195),
(2547, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 206, 1, 0, '2020-03-31 11:44:33', '2020-03-31 11:44:33', 195),
(2548, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 206, 1, 0, '2020-03-31 11:47:37', '2020-03-31 11:47:37', 195),
(2549, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 206, 1, 0, '2020-03-31 11:50:28', '2020-03-31 11:50:28', 195),
(2550, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 206, 1, 0, '2020-03-31 11:51:27', '2020-03-31 11:51:27', 195),
(2551, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 206, 1, 0, '2020-03-31 11:53:22', '2020-03-31 11:53:22', 195),
(2552, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 206, 1, 0, '2020-03-31 11:55:38', '2020-03-31 11:55:38', 195),
(2554, 'Created new Sub Category ', 'app\\models\\SubCategory', 4, 1, 0, '2020-03-31 12:00:02', '2020-03-31 12:00:02', 1),
(2555, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-31 12:00:35', '2020-03-31 12:00:35', 179),
(2556, 'Created new Login History ', 'app\\models\\LoginHistory', 222, 1, 0, '2020-03-31 12:00:56', '2020-03-31 12:00:56', NULL),
(2557, 'Modified User ', 'app\\models\\User', 184, 1, 0, '2020-03-31 12:00:56', '2020-03-31 12:00:56', 184),
(2558, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 208, 1, 0, '2020-03-31 12:00:56', '2020-03-31 12:00:56', 184),
(2559, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 208, 1, 0, '2020-03-31 12:01:10', '2020-03-31 12:01:10', 184),
(2560, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 208, 1, 0, '2020-03-31 12:02:05', '2020-03-31 12:02:05', 184),
(2561, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 208, 1, 0, '2020-03-31 12:02:54', '2020-03-31 12:02:54', 184),
(2562, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 208, 1, 0, '2020-03-31 12:04:22', '2020-03-31 12:04:22', 184),
(2563, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 208, 1, 0, '2020-03-31 12:05:27', '2020-03-31 12:05:27', 184),
(2564, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 208, 1, 0, '2020-03-31 12:07:55', '2020-03-31 12:07:55', 184),
(2565, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 208, 1, 0, '2020-03-31 12:08:33', '2020-03-31 12:08:33', 184),
(2566, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 208, 1, 0, '2020-03-31 12:09:00', '2020-03-31 12:09:00', 184),
(2567, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 208, 1, 0, '2020-03-31 12:09:25', '2020-03-31 12:09:25', 184),
(2568, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 208, 1, 0, '2020-03-31 12:09:50', '2020-03-31 12:09:50', 184),
(2569, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 208, 1, 0, '2020-03-31 12:10:18', '2020-03-31 12:10:18', 184),
(2570, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 208, 1, 0, '2020-03-31 12:10:50', '2020-03-31 12:10:50', 184),
(2571, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 208, 1, 0, '2020-03-31 12:11:45', '2020-03-31 12:11:45', 184),
(2572, 'Created new Login History ', 'app\\models\\LoginHistory', 223, 1, 0, '2020-03-31 12:11:52', '2020-03-31 12:11:52', NULL),
(2573, 'Modified User ', 'app\\models\\User', 184, 1, 0, '2020-03-31 12:11:52', '2020-03-31 12:11:52', 184),
(2574, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-03-31 12:11:52', '2020-03-31 12:11:52', 184),
(2575, 'Created new Sub Category ', 'app\\models\\SubCategory', 5, 1, 0, '2020-03-31 12:14:00', '2020-03-31 12:14:00', 1),
(2576, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-03-31 12:14:31', '2020-03-31 12:14:31', 184),
(2577, 'Created new Sub Category ', 'app\\models\\SubCategory', 6, 1, 0, '2020-03-31 12:19:13', '2020-03-31 12:19:13', 1),
(2578, 'Created new Sub Category ', 'app\\models\\SubCategory', 7, 1, 0, '2020-03-31 12:20:11', '2020-03-31 12:20:11', 1),
(2579, 'Created new Illness ', 'app\\models\\Illness', 7, 1, 0, '2020-03-31 12:21:10', '2020-03-31 12:21:10', 1),
(2580, 'Created new Illness ', 'app\\models\\Illness', 8, 1, 0, '2020-03-31 12:21:34', '2020-03-31 12:21:34', 1),
(2581, 'Created new Illness ', 'app\\models\\Illness', 9, 1, 0, '2020-03-31 12:22:07', '2020-03-31 12:22:07', 1),
(2582, 'Created new Illness ', 'app\\models\\Illness', 10, 1, 0, '2020-03-31 12:23:04', '2020-03-31 12:23:04', 1),
(2583, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-03-31 12:29:53', '2020-03-31 12:29:53', 184),
(2584, 'Created new Illness ', 'app\\models\\Illness', 11, 1, 0, '2020-03-31 12:33:08', '2020-03-31 12:33:08', 1),
(2585, 'Created new Illness ', 'app\\models\\Illness', 12, 1, 0, '2020-03-31 12:33:39', '2020-03-31 12:33:39', 1),
(2586, 'Created new Illness ', 'app\\models\\Illness', 13, 1, 0, '2020-03-31 12:33:54', '2020-03-31 12:33:54', 1),
(2587, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 193, 1, 0, '2020-03-31 12:40:00', '2020-03-31 12:40:00', 179),
(2588, 'Created new Login History ', 'app\\models\\LoginHistory', 224, 1, 0, '2020-03-31 12:40:49', '2020-03-31 12:40:49', NULL),
(2589, 'Modified User ', 'app\\models\\User', 179, 1, 0, '2020-03-31 12:40:49', '2020-03-31 12:40:49', 179),
(2590, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-03-31 12:40:49', '2020-03-31 12:40:49', 179),
(2591, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-03-31 12:41:47', '2020-03-31 12:41:47', 179),
(2592, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-03-31 12:42:27', '2020-03-31 12:42:27', 179),
(2593, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 206, 1, 0, '2020-03-31 12:42:51', '2020-03-31 12:42:51', 195),
(2594, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 206, 1, 0, '2020-03-31 12:57:23', '2020-03-31 12:57:23', 195),
(2595, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 206, 1, 0, '2020-03-31 13:10:59', '2020-03-31 13:10:59', 195),
(2596, 'Created new Login History ', 'app\\models\\LoginHistory', 225, 1, 0, '2020-03-31 13:16:29', '2020-03-31 13:16:29', NULL),
(2597, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 206, 1, 0, '2020-03-31 13:33:04', '2020-03-31 13:33:04', 195),
(2598, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 206, 1, 0, '2020-03-31 13:34:35', '2020-03-31 13:34:35', 195),
(2599, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-03-31 13:43:33', '2020-03-31 13:43:33', 184),
(2600, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 206, 1, 0, '2020-03-31 13:45:44', '2020-03-31 13:45:44', 195),
(2601, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-03-31 13:46:01', '2020-03-31 13:46:01', 184),
(2602, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 206, 1, 0, '2020-03-31 13:48:57', '2020-03-31 13:48:57', 195),
(2603, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-03-31 13:49:01', '2020-03-31 13:49:01', 184),
(2604, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-03-31 13:50:30', '2020-03-31 13:50:30', 184),
(2605, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-03-31 14:26:58', '2020-03-31 14:26:58', 184),
(2606, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-03-31 14:28:54', '2020-03-31 14:28:54', 184),
(2607, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-03-31 14:30:50', '2020-03-31 14:30:50', 184),
(2608, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-31 14:41:42', '2020-03-31 14:41:42', 173),
(2609, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-31 14:42:52', '2020-03-31 14:42:52', 173),
(2610, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-31 14:47:42', '2020-03-31 14:47:42', 173),
(2611, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-31 14:50:59', '2020-03-31 14:50:59', 173),
(2612, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-03-31 14:52:07', '2020-03-31 14:52:07', 184),
(2613, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-03-31 14:56:06', '2020-03-31 14:56:06', 184),
(2614, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-03-31 15:02:13', '2020-03-31 15:02:13', 184),
(2615, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-03-31 15:13:08', '2020-03-31 15:13:08', 184),
(2616, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-31 15:16:25', '2020-03-31 15:16:25', 173),
(2617, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-03-31 15:17:24', '2020-03-31 15:17:24', 184),
(2618, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-31 15:17:25', '2020-03-31 15:17:25', 173),
(2619, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-03-31 15:19:48', '2020-03-31 15:19:48', 184),
(2620, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-31 15:20:05', '2020-03-31 15:20:05', 173),
(2624, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-31 15:21:26', '2020-03-31 15:21:26', 173),
(2625, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-03-31 15:21:30', '2020-03-31 15:21:30', 184),
(2632, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-03-31 15:25:42', '2020-03-31 15:25:42', 184),
(2633, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-31 15:33:25', '2020-03-31 15:33:25', 173),
(2634, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-31 15:36:50', '2020-03-31 15:36:50', 173),
(2635, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-31 15:43:01', '2020-03-31 15:43:01', 173),
(2636, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-31 15:46:29', '2020-03-31 15:46:29', 173),
(2637, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-31 15:53:05', '2020-03-31 15:53:05', 173),
(2638, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-03-31 15:54:42', '2020-03-31 15:54:42', 184),
(2639, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-03-31 16:05:12', '2020-03-31 16:05:12', 184),
(2640, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-31 16:08:17', '2020-03-31 16:08:17', 173),
(2641, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-03-31 16:09:09', '2020-03-31 16:09:09', 184),
(2642, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-31 16:10:05', '2020-03-31 16:10:05', 173),
(2643, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-31 16:11:50', '2020-03-31 16:11:50', 173);
INSERT INTO `tbl_feed` (`id`, `content`, `model_type`, `model_id`, `state_id`, `type_id`, `created_on`, `updated_on`, `created_by_id`) VALUES
(2644, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-31 16:16:16', '2020-03-31 16:16:16', 173),
(2645, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-31 16:19:19', '2020-03-31 16:19:19', 173),
(2646, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-31 16:20:46', '2020-03-31 16:20:46', 173),
(2647, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-31 16:21:42', '2020-03-31 16:21:42', 173),
(2648, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-31 16:23:23', '2020-03-31 16:23:23', 173),
(2658, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-31 16:29:33', '2020-03-31 16:29:33', 173),
(2707, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-03-31 16:54:52', '2020-03-31 16:54:52', 179),
(2708, 'Created new User ', 'app\\models\\User', 196, 1, 0, '2020-03-31 16:56:37', '2020-03-31 16:56:37', NULL),
(2709, 'Created new User Wallet ', 'app\\models\\UserWallet', 149, 1, 0, '2020-03-31 16:56:37', '2020-03-31 16:56:37', NULL),
(2710, 'Created new Patient Medical Information ', 'app\\models\\PatientMedicalInformation', 144, 1, 0, '2020-03-31 16:56:37', '2020-03-31 16:56:37', NULL),
(2711, 'Created new Patientsymptom ', 'app\\models\\Patientsymptom', 258, 1, 0, '2020-03-31 16:56:37', '2020-03-31 16:56:37', NULL),
(2712, 'Created new Patientsymptom ', 'app\\models\\Patientsymptom', 259, 1, 0, '2020-03-31 16:56:37', '2020-03-31 16:56:37', NULL),
(2713, 'Created new Login History ', 'app\\models\\LoginHistory', 226, 1, 0, '2020-03-31 16:56:52', '2020-03-31 16:56:52', NULL),
(2714, 'Modified User ', 'app\\models\\User', 196, 1, 0, '2020-03-31 16:56:52', '2020-03-31 16:56:52', 196),
(2715, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 211, 1, 0, '2020-03-31 16:56:52', '2020-03-31 16:56:52', 196),
(2716, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 211, 1, 0, '2020-03-31 17:01:06', '2020-03-31 17:01:06', 196),
(2717, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 211, 1, 0, '2020-03-31 17:19:35', '2020-03-31 17:19:35', 196),
(2718, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 211, 1, 0, '2020-03-31 17:24:34', '2020-03-31 17:24:34', 196),
(2719, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 211, 1, 0, '2020-03-31 17:26:54', '2020-03-31 17:26:54', 196),
(2720, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 211, 1, 0, '2020-03-31 17:28:26', '2020-03-31 17:28:26', 196),
(2721, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 211, 1, 0, '2020-03-31 17:28:44', '2020-03-31 17:28:44', 196),
(2722, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 211, 1, 0, '2020-03-31 17:29:27', '2020-03-31 17:29:27', 196),
(2723, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 211, 1, 0, '2020-03-31 17:35:44', '2020-03-31 17:35:44', 196),
(2724, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 206, 1, 0, '2020-03-31 17:43:23', '2020-03-31 17:43:23', 195),
(2726, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 211, 1, 0, '2020-03-31 18:00:18', '2020-03-31 18:00:18', 196),
(2727, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-31 18:03:16', '2020-03-31 18:03:16', 173),
(2760, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-31 18:04:38', '2020-03-31 18:04:38', 173),
(2793, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-31 18:16:34', '2020-03-31 18:16:34', 173),
(2794, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-03-31 18:26:57', '2020-03-31 18:26:57', 173),
(2795, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 211, 1, 0, '2020-03-31 18:27:07', '2020-03-31 18:27:07', 196),
(2828, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 196, 1, 0, '2020-03-31 19:54:47', '2020-03-31 19:54:47', 153),
(2829, 'Created new User ', 'app\\models\\User', 197, 1, 0, '2020-03-31 20:23:38', '2020-03-31 20:23:38', NULL),
(2830, 'Created new User Wallet ', 'app\\models\\UserWallet', 150, 1, 0, '2020-03-31 20:23:38', '2020-03-31 20:23:38', NULL),
(2831, 'Created new Patient Medical Information ', 'app\\models\\PatientMedicalInformation', 145, 1, 0, '2020-03-31 20:23:38', '2020-03-31 20:23:38', NULL),
(2832, 'Created new Patientsymptom ', 'app\\models\\Patientsymptom', 260, 1, 0, '2020-03-31 20:23:38', '2020-03-31 20:23:38', NULL),
(2833, 'Created new Patientsymptom ', 'app\\models\\Patientsymptom', 261, 1, 0, '2020-03-31 20:23:38', '2020-03-31 20:23:38', NULL),
(2834, 'Created new Login History ', 'app\\models\\LoginHistory', 227, 1, 0, '2020-03-31 20:26:00', '2020-03-31 20:26:00', NULL),
(2835, 'Created new Login History ', 'app\\models\\LoginHistory', 228, 1, 0, '2020-03-31 20:26:22', '2020-03-31 20:26:22', NULL),
(2836, 'Created new Login History ', 'app\\models\\LoginHistory', 229, 1, 0, '2020-03-31 20:32:16', '2020-03-31 20:32:16', NULL),
(2837, 'Created new Login History ', 'app\\models\\LoginHistory', 230, 1, 0, '2020-03-31 20:32:44', '2020-03-31 20:32:44', NULL),
(2838, 'Created new Login History ', 'app\\models\\LoginHistory', 231, 1, 0, '2020-03-31 20:32:47', '2020-03-31 20:32:47', NULL),
(2839, 'Created new Login History ', 'app\\models\\LoginHistory', 232, 1, 0, '2020-03-31 20:32:50', '2020-03-31 20:32:50', NULL),
(2840, 'Created new Login History ', 'app\\models\\LoginHistory', 233, 1, 0, '2020-03-31 20:34:17', '2020-03-31 20:34:17', NULL),
(2841, 'Created new Login History ', 'app\\models\\LoginHistory', 234, 1, 0, '2020-03-31 20:34:21', '2020-03-31 20:34:21', NULL),
(2842, 'Created new Login History ', 'app\\models\\LoginHistory', 235, 1, 0, '2020-03-31 20:34:44', '2020-03-31 20:34:44', NULL),
(2843, 'Created new User ', 'app\\models\\User', 198, 1, 0, '2020-03-31 20:37:46', '2020-03-31 20:37:46', NULL),
(2844, 'Created new User Wallet ', 'app\\models\\UserWallet', 151, 1, 0, '2020-03-31 20:37:46', '2020-03-31 20:37:46', NULL),
(2845, 'Created new Patient Medical Information ', 'app\\models\\PatientMedicalInformation', 146, 1, 0, '2020-03-31 20:37:46', '2020-03-31 20:37:46', NULL),
(2846, 'Created new Patientsymptom ', 'app\\models\\Patientsymptom', 262, 1, 0, '2020-03-31 20:37:46', '2020-03-31 20:37:46', NULL),
(2847, 'Created new Patientsymptom ', 'app\\models\\Patientsymptom', 263, 1, 0, '2020-03-31 20:37:46', '2020-03-31 20:37:46', NULL),
(2848, 'Created new Login History ', 'app\\models\\LoginHistory', 236, 1, 0, '2020-03-31 20:38:20', '2020-03-31 20:38:20', NULL),
(2849, 'Modified User ', 'app\\models\\User', 198, 1, 0, '2020-03-31 20:38:20', '2020-03-31 20:38:20', 198),
(2850, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 212, 1, 0, '2020-03-31 20:38:20', '2020-03-31 20:38:20', 198),
(2851, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 212, 1, 0, '2020-03-31 21:16:06', '2020-03-31 21:16:06', 198),
(2852, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 195, 1, 0, '2020-03-31 21:50:06', '2020-03-31 21:50:06', 190),
(2853, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 195, 1, 0, '2020-03-31 21:58:16', '2020-03-31 21:58:16', 190),
(2854, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 171, 1, 0, '2020-03-31 23:08:54', '2020-03-31 23:08:54', 176),
(2855, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 196, 1, 0, '2020-04-01 00:23:11', '2020-04-01 00:23:11', 153),
(2856, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-01 10:18:36', '2020-04-01 10:18:36', 179),
(2857, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-01 10:39:32', '2020-04-01 10:39:32', 179),
(2858, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-01 10:43:40', '2020-04-01 10:43:40', 179),
(2859, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-01 10:50:08', '2020-04-01 10:50:08', 179),
(2860, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 204, 1, 0, '2020-04-01 10:51:38', '2020-04-01 10:51:38', 173),
(2862, 'Created new Login History ', 'app\\models\\LoginHistory', 237, 1, 0, '2020-04-01 10:52:41', '2020-04-01 10:52:41', NULL),
(2864, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 213, 1, 0, '2020-04-01 10:52:41', '2020-04-01 10:52:41', 195),
(2865, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-01 10:53:56', '2020-04-01 10:53:56', 179),
(2898, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-01 11:15:49', '2020-04-01 11:15:49', 179),
(2899, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-01 11:17:56', '2020-04-01 11:17:56', 179),
(2900, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-04-01 11:49:59', '2020-04-01 11:49:59', 184),
(2901, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-04-01 12:02:06', '2020-04-01 12:02:06', 184),
(2902, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-01 12:28:44', '2020-04-01 12:28:44', 179),
(2903, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-04-01 12:29:34', '2020-04-01 12:29:34', 184),
(2904, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-01 12:32:00', '2020-04-01 12:32:00', 179),
(2905, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-01 12:34:14', '2020-04-01 12:34:14', 179),
(2906, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-01 12:37:34', '2020-04-01 12:37:34', 179),
(2907, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-04-01 12:49:20', '2020-04-01 12:49:20', 184),
(2908, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-04-01 13:06:56', '2020-04-01 13:06:56', 184),
(2909, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-04-01 13:13:20', '2020-04-01 13:13:20', 184),
(2910, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-04-01 13:14:27', '2020-04-01 13:14:27', 184),
(2912, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-04-01 13:17:59', '2020-04-01 13:17:59', 184),
(2913, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 211, 1, 0, '2020-04-01 13:19:33', '2020-04-01 13:19:33', 196),
(2914, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-04-01 13:23:37', '2020-04-01 13:23:37', 184),
(2915, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-04-01 13:28:46', '2020-04-01 13:28:46', 184),
(2916, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-04-01 13:39:39', '2020-04-01 13:39:39', 184),
(2917, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-01 14:43:54', '2020-04-01 14:43:54', 179),
(2918, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-01 14:55:19', '2020-04-01 14:55:19', 179),
(2919, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-01 14:56:18', '2020-04-01 14:56:18', 179),
(2922, 'Created new Notification ', 'app\\modules\\notification\\models\\Notification', 2, 1, 0, '2020-04-01 14:56:42', '2020-04-01 14:56:42', 179),
(2925, 'Created new Notification ', 'app\\modules\\notification\\models\\Notification', 4, 1, 0, '2020-04-01 14:57:08', '2020-04-01 14:57:08', 179),
(2928, 'Created new Notification ', 'app\\modules\\notification\\models\\Notification', 6, 1, 0, '2020-04-01 14:57:32', '2020-04-01 14:57:32', 179),
(2931, 'Created new Notification ', 'app\\modules\\notification\\models\\Notification', 8, 1, 0, '2020-04-01 14:57:36', '2020-04-01 14:57:36', 179),
(2932, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-01 15:26:22', '2020-04-01 15:26:22', 179),
(2933, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-01 15:27:14', '2020-04-01 15:27:14', 179),
(2934, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-01 15:27:33', '2020-04-01 15:27:33', 179),
(2937, 'Created new Notification ', 'app\\modules\\notification\\models\\Notification', 10, 1, 0, '2020-04-01 15:28:08', '2020-04-01 15:28:08', 179),
(2938, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-01 15:31:34', '2020-04-01 15:31:34', 179),
(2939, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-01 15:34:47', '2020-04-01 15:34:47', 179),
(2940, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-01 15:35:29', '2020-04-01 15:35:29', 179),
(2941, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-01 15:40:08', '2020-04-01 15:40:08', 179),
(2942, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-01 15:41:52', '2020-04-01 15:41:52', 179),
(2945, 'Created new Notification ', 'app\\modules\\notification\\models\\Notification', 12, 1, 0, '2020-04-01 15:42:57', '2020-04-01 15:42:57', 179),
(2948, 'Created new Notification ', 'app\\modules\\notification\\models\\Notification', 14, 1, 0, '2020-04-01 15:43:34', '2020-04-01 15:43:34', 179),
(2949, 'Created new Login History ', 'app\\models\\LoginHistory', 238, 1, 0, '2020-04-01 16:47:32', '2020-04-01 16:47:32', NULL),
(2951, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 214, 1, 0, '2020-04-01 16:47:32', '2020-04-01 16:47:32', 173),
(2952, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-04-01 16:47:39', '2020-04-01 16:47:39', 184),
(2954, 'Created new Login History ', 'app\\models\\LoginHistory', 239, 1, 0, '2020-04-01 16:48:56', '2020-04-01 16:48:56', NULL),
(2957, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-04-01 16:49:57', '2020-04-01 16:49:57', 184),
(2958, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-04-01 17:33:50', '2020-04-01 17:33:50', 184),
(2959, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-04-01 17:38:16', '2020-04-01 17:38:16', 184),
(2960, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-04-01 17:45:24', '2020-04-01 17:45:24', 184),
(2961, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 196, 1, 0, '2020-04-01 17:57:26', '2020-04-01 17:57:26', 153),
(2962, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-04-01 18:04:48', '2020-04-01 18:04:48', 184),
(2963, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 209, 1, 0, '2020-04-01 18:11:31', '2020-04-01 18:11:31', 184),
(2965, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 10:01:54', '2020-04-02 10:01:54', 179),
(2966, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 10:19:13', '2020-04-02 10:19:13', 179),
(2967, 'Created new Login History ', 'app\\models\\LoginHistory', 240, 1, 0, '2020-04-02 10:21:41', '2020-04-02 10:21:41', NULL),
(2968, 'Modified User ', 'app\\models\\User', 184, 1, 0, '2020-04-02 10:21:41', '2020-04-02 10:21:41', 184),
(2969, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 10:21:41', '2020-04-02 10:21:41', 184),
(2970, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 10:25:36', '2020-04-02 10:25:36', 184),
(2971, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 10:25:46', '2020-04-02 10:25:46', 179),
(2972, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 10:27:24', '2020-04-02 10:27:24', 179),
(2973, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 10:27:44', '2020-04-02 10:27:44', 179),
(2974, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 10:34:08', '2020-04-02 10:34:08', 184),
(2977, 'Created new Notification ', 'app\\modules\\notification\\models\\Notification', 16, 1, 0, '2020-04-02 10:36:40', '2020-04-02 10:36:40', 184),
(2978, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 10:39:44', '2020-04-02 10:39:44', 179),
(2979, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 10:40:49', '2020-04-02 10:40:49', 179),
(2980, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 10:41:04', '2020-04-02 10:41:04', 184),
(2981, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 10:44:25', '2020-04-02 10:44:25', 179),
(2982, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 10:48:46', '2020-04-02 10:48:46', 179),
(2983, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 10:49:26', '2020-04-02 10:49:26', 179),
(2984, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 10:52:48', '2020-04-02 10:52:48', 184),
(2985, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 10:55:27', '2020-04-02 10:55:27', 184),
(2986, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 10:58:55', '2020-04-02 10:58:55', 184),
(2987, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 11:05:28', '2020-04-02 11:05:28', 184),
(2988, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 11:06:41', '2020-04-02 11:06:41', 179),
(2989, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 11:07:49', '2020-04-02 11:07:49', 179),
(2990, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 11:08:46', '2020-04-02 11:08:46', 184),
(2991, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 11:09:14', '2020-04-02 11:09:14', 179),
(2992, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 11:14:46', '2020-04-02 11:14:46', 179),
(2993, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 11:15:48', '2020-04-02 11:15:48', 179),
(2994, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 11:18:31', '2020-04-02 11:18:31', 179),
(2995, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 11:18:45', '2020-04-02 11:18:45', 184),
(2996, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 11:19:52', '2020-04-02 11:19:52', 179),
(2997, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 11:25:48', '2020-04-02 11:25:48', 179),
(2998, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 11:27:58', '2020-04-02 11:27:58', 179),
(2999, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 11:30:21', '2020-04-02 11:30:21', 179),
(3000, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 11:39:04', '2020-04-02 11:39:04', 179),
(3001, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 11:40:08', '2020-04-02 11:40:08', 179),
(3002, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 11:41:00', '2020-04-02 11:41:00', 179),
(3003, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 11:45:37', '2020-04-02 11:45:37', 179),
(3004, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 11:45:38', '2020-04-02 11:45:38', 184),
(3005, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 11:47:45', '2020-04-02 11:47:45', 179),
(3006, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 11:49:17', '2020-04-02 11:49:17', 179),
(3007, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 11:50:36', '2020-04-02 11:50:36', 179),
(3008, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 11:51:13', '2020-04-02 11:51:13', 179),
(3009, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 11:52:57', '2020-04-02 11:52:57', 179),
(3010, 'Created new Login History ', 'app\\models\\LoginHistory', 241, 1, 0, '2020-04-02 11:59:02', '2020-04-02 11:59:02', NULL),
(3011, 'Created new Login History ', 'app\\models\\LoginHistory', 242, 1, 0, '2020-04-02 11:59:15', '2020-04-02 11:59:15', NULL),
(3012, 'Modified Category ', 'app\\models\\Category', 19, 1, 0, '2020-04-02 12:02:08', '2020-04-02 12:02:08', 1),
(3013, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 12:04:59', '2020-04-02 12:04:59', 179),
(3014, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 12:12:27', '2020-04-02 12:12:27', 179),
(3015, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 12:17:59', '2020-04-02 12:17:59', 179),
(3016, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 12:23:07', '2020-04-02 12:23:07', 179),
(3017, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 12:25:43', '2020-04-02 12:25:43', 179),
(3018, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 12:26:04', '2020-04-02 12:26:04', 179),
(3019, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 12:27:53', '2020-04-02 12:27:53', 184),
(3020, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 12:32:20', '2020-04-02 12:32:20', 184),
(3021, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 12:33:19', '2020-04-02 12:33:19', 184),
(3022, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 12:34:17', '2020-04-02 12:34:17', 179),
(3023, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 12:35:38', '2020-04-02 12:35:38', 179),
(3024, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 12:36:07', '2020-04-02 12:36:07', 184),
(3025, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 12:39:38', '2020-04-02 12:39:38', 179),
(3026, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 12:42:12', '2020-04-02 12:42:12', 179),
(3027, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 12:47:48', '2020-04-02 12:47:48', 179),
(3028, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 12:48:28', '2020-04-02 12:48:28', 179),
(3029, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 12:52:37', '2020-04-02 12:52:37', 179),
(3030, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 12:54:00', '2020-04-02 12:54:00', 179),
(3031, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 13:01:55', '2020-04-02 13:01:55', 179),
(3032, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 13:08:11', '2020-04-02 13:08:11', 179),
(3033, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 13:09:48', '2020-04-02 13:09:48', 179),
(3034, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 13:20:03', '2020-04-02 13:20:03', 179),
(3035, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 13:21:34', '2020-04-02 13:21:34', 179),
(3036, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 13:39:37', '2020-04-02 13:39:37', 184),
(3037, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 14:29:10', '2020-04-02 14:29:10', 184),
(3038, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 14:39:06', '2020-04-02 14:39:06', 184),
(3039, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 14:47:21', '2020-04-02 14:47:21', 184),
(3040, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 14:48:46', '2020-04-02 14:48:46', 184),
(3041, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 14:50:20', '2020-04-02 14:50:20', 184),
(3042, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 196, 1, 0, '2020-04-02 14:52:44', '2020-04-02 14:52:44', 153),
(3043, 'Modified Category ', 'app\\models\\Category', 20, 1, 0, '2020-04-02 15:15:18', '2020-04-02 15:15:18', 1),
(3044, 'Created new Category ', 'app\\models\\Category', 21, 1, 0, '2020-04-02 15:18:52', '2020-04-02 15:18:52', 1),
(3045, 'Created new Category ', 'app\\models\\Category', 22, 1, 0, '2020-04-02 15:19:57', '2020-04-02 15:19:57', 1),
(3046, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 211, 1, 0, '2020-04-02 15:23:13', '2020-04-02 15:23:13', 196),
(3047, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 15:23:48', '2020-04-02 15:23:48', 184),
(3048, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 211, 1, 0, '2020-04-02 15:25:02', '2020-04-02 15:25:02', 196),
(3049, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 211, 1, 0, '2020-04-02 15:25:38', '2020-04-02 15:25:38', 196),
(3050, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 211, 1, 0, '2020-04-02 15:31:52', '2020-04-02 15:31:52', 196),
(3051, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 211, 1, 0, '2020-04-02 15:37:42', '2020-04-02 15:37:42', 196),
(3052, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 15:39:04', '2020-04-02 15:39:04', 179),
(3053, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 15:46:13', '2020-04-02 15:46:13', 179),
(3054, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 15:47:25', '2020-04-02 15:47:25', 179),
(3055, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 15:55:19', '2020-04-02 15:55:19', 179),
(3056, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 16:04:58', '2020-04-02 16:04:58', 179),
(3057, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 16:07:59', '2020-04-02 16:07:59', 184),
(3058, 'Created new Login History ', 'app\\models\\LoginHistory', 243, 1, 0, '2020-04-02 16:11:41', '2020-04-02 16:11:41', NULL),
(3059, 'Modified Consultation Availability ', 'app\\models\\ConsultationAvailability', 1, 1, 0, '2020-04-02 16:13:45', '2020-04-02 16:13:45', 1),
(3060, 'Modified Consultation Availability ', 'app\\models\\ConsultationAvailability', 2, 1, 0, '2020-04-02 16:14:07', '2020-04-02 16:14:07', 1),
(3061, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 16:14:46', '2020-04-02 16:14:46', 184),
(3062, 'Modified Consultation Availability ', 'app\\models\\ConsultationAvailability', 2, 1, 0, '2020-04-02 16:15:02', '2020-04-02 16:15:02', 1),
(3063, 'Created new Consultation Availability ', 'app\\models\\ConsultationAvailability', 3, 1, 0, '2020-04-02 16:15:54', '2020-04-02 16:15:54', 1),
(3064, 'Created new Consultation Availability ', 'app\\models\\ConsultationAvailability', 4, 1, 0, '2020-04-02 16:16:46', '2020-04-02 16:16:46', 1),
(3065, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 16:20:53', '2020-04-02 16:20:53', 179),
(3068, 'Created new Notification ', 'app\\modules\\notification\\models\\Notification', 18, 1, 0, '2020-04-02 16:25:08', '2020-04-02 16:25:08', 179),
(3071, 'Created new Notification ', 'app\\modules\\notification\\models\\Notification', 20, 1, 0, '2020-04-02 16:28:41', '2020-04-02 16:28:41', 179),
(3072, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 16:36:04', '2020-04-02 16:36:04', 179),
(3073, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 16:37:10', '2020-04-02 16:37:10', 184),
(3074, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 16:39:23', '2020-04-02 16:39:23', 184),
(3075, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 16:48:03', '2020-04-02 16:48:03', 179),
(3076, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 210, 1, 0, '2020-04-02 16:48:16', '2020-04-02 16:48:16', 179),
(3084, 'Created new Login History ', 'app\\models\\LoginHistory', 244, 1, 0, '2020-04-02 16:51:17', '2020-04-02 16:51:17', NULL),
(3086, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 217, 1, 0, '2020-04-02 16:51:17', '2020-04-02 16:51:17', 199),
(3087, 'Modified User ', 'app\\models\\User', 179, 1, 0, '2020-04-02 16:51:37', '2020-04-02 16:51:37', NULL),
(3088, 'Created new Login History ', 'app\\models\\LoginHistory', 245, 1, 0, '2020-04-02 16:51:48', '2020-04-02 16:51:48', NULL),
(3089, 'Modified User ', 'app\\models\\User', 179, 1, 0, '2020-04-02 16:51:48', '2020-04-02 16:51:48', 179),
(3090, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 218, 1, 0, '2020-04-02 16:51:48', '2020-04-02 16:51:48', 179),
(3091, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 16:52:11', '2020-04-02 16:52:11', 184),
(3092, 'Created new Login History ', 'app\\models\\LoginHistory', 246, 1, 0, '2020-04-02 16:52:33', '2020-04-02 16:52:33', NULL),
(3094, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 219, 1, 0, '2020-04-02 16:52:33', '2020-04-02 16:52:33', 199),
(3095, 'Created new Login History ', 'app\\models\\LoginHistory', 247, 1, 0, '2020-04-02 16:52:41', '2020-04-02 16:52:41', NULL),
(3098, 'Created new Login History ', 'app\\models\\LoginHistory', 248, 1, 0, '2020-04-02 16:52:56', '2020-04-02 16:52:56', NULL),
(3101, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 16:54:09', '2020-04-02 16:54:09', 184),
(3102, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 218, 1, 0, '2020-04-02 16:55:45', '2020-04-02 16:55:45', 179),
(3103, 'Created new Login History ', 'app\\models\\LoginHistory', 249, 1, 0, '2020-04-02 16:56:24', '2020-04-02 16:56:24', NULL),
(3104, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 218, 1, 0, '2020-04-02 17:01:11', '2020-04-02 17:01:11', 179),
(3105, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 218, 1, 0, '2020-04-02 17:01:56', '2020-04-02 17:01:56', 179),
(3106, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 17:02:46', '2020-04-02 17:02:46', 184),
(3107, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 218, 1, 0, '2020-04-02 17:03:42', '2020-04-02 17:03:42', 179),
(3108, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 17:07:12', '2020-04-02 17:07:12', 184),
(3109, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 218, 1, 0, '2020-04-02 17:09:33', '2020-04-02 17:09:33', 179),
(3110, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 17:10:39', '2020-04-02 17:10:39', 184),
(3111, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 218, 1, 0, '2020-04-02 17:11:42', '2020-04-02 17:11:42', 179),
(3112, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 17:14:37', '2020-04-02 17:14:37', 184),
(3113, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 17:14:55', '2020-04-02 17:14:55', 184),
(3114, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 218, 1, 0, '2020-04-02 17:15:14', '2020-04-02 17:15:14', 179),
(3115, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 218, 1, 0, '2020-04-02 17:18:34', '2020-04-02 17:18:34', 179),
(3116, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 218, 1, 0, '2020-04-02 17:23:25', '2020-04-02 17:23:25', 179),
(3117, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 218, 1, 0, '2020-04-02 17:23:57', '2020-04-02 17:23:57', 179),
(3118, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 218, 1, 0, '2020-04-02 17:29:27', '2020-04-02 17:29:27', 179),
(3119, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 218, 1, 0, '2020-04-02 17:32:03', '2020-04-02 17:32:03', 179),
(3120, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 218, 1, 0, '2020-04-02 17:33:15', '2020-04-02 17:33:15', 179),
(3121, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 218, 1, 0, '2020-04-02 17:35:44', '2020-04-02 17:35:44', 179),
(3122, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 218, 1, 0, '2020-04-02 17:37:17', '2020-04-02 17:37:17', 179),
(3123, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 218, 1, 0, '2020-04-02 17:38:37', '2020-04-02 17:38:37', 179),
(3124, 'Created new Login History ', 'app\\models\\LoginHistory', 250, 1, 0, '2020-04-02 17:44:02', '2020-04-02 17:44:02', NULL),
(3125, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 17:45:25', '2020-04-02 17:45:25', 184),
(3126, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 218, 1, 0, '2020-04-02 17:46:14', '2020-04-02 17:46:14', 179),
(3127, 'Created new User ', 'app\\models\\User', 200, 1, 0, '2020-04-02 17:47:39', '2020-04-02 17:47:39', NULL),
(3128, 'Created new Workprofile ', 'app\\models\\Workprofile', 45, 1, 0, '2020-04-02 17:47:39', '2020-04-02 17:47:39', NULL),
(3129, 'Created new Doctorspecialization ', 'app\\models\\Doctorspecialization', 74, 1, 0, '2020-04-02 17:47:39', '2020-04-02 17:47:39', NULL),
(3130, 'Created new Doctorspecialization ', 'app\\models\\Doctorspecialization', 75, 1, 0, '2020-04-02 17:47:39', '2020-04-02 17:47:39', NULL),
(3131, 'Created new Doctor Language ', 'app\\models\\DoctorLanguage', 17, 1, 0, '2020-04-02 17:47:39', '2020-04-02 17:47:39', NULL),
(3132, 'Created new Doctor Language ', 'app\\models\\DoctorLanguage', 18, 1, 0, '2020-04-02 17:47:39', '2020-04-02 17:47:39', NULL),
(3133, 'Created new Login History ', 'app\\models\\LoginHistory', 251, 1, 0, '2020-04-02 17:47:52', '2020-04-02 17:47:52', NULL),
(3134, 'Modified User ', 'app\\models\\User', 200, 1, 0, '2020-04-02 17:47:52', '2020-04-02 17:47:52', 200),
(3135, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 222, 1, 0, '2020-04-02 17:47:52', '2020-04-02 17:47:52', 200),
(3136, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 90, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3137, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 106, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3138, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 91, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3139, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 107, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3140, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 92, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3141, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 108, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3142, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 93, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3143, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 109, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3144, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 94, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3145, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 110, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3146, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 95, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3147, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 111, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3148, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 96, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3149, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 112, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3150, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 97, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3151, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 113, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3152, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 98, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3153, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 114, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3154, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 99, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3155, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 115, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3156, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 100, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3157, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 116, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3158, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 101, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3159, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 117, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3160, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 102, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3161, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 118, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3162, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 103, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3163, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 119, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3164, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 104, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3165, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 120, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3166, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 105, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3167, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 121, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3168, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 106, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3169, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 122, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3170, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 107, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3171, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 123, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3172, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 108, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3173, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 124, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3174, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 109, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3175, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 125, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3176, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 110, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3177, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 126, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3178, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 111, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3179, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 127, 1, 0, '2020-04-02 17:48:07', '2020-04-02 17:48:07', 200),
(3180, 'Created new Doctor Consultation Availability ', 'app\\models\\DoctorConsultationAvailability', 10, 1, 0, '2020-04-02 17:48:58', '2020-04-02 17:48:58', 200),
(3181, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 218, 1, 0, '2020-04-02 17:49:09', '2020-04-02 17:49:09', 179),
(3182, 'Modified User ', 'app\\models\\User', 200, 1, 0, '2020-04-02 17:50:24', '2020-04-02 17:50:24', NULL),
(3183, 'Created new User ', 'app\\models\\User', 201, 1, 0, '2020-04-02 17:51:15', '2020-04-02 17:51:15', NULL),
(3184, 'Created new Workprofile ', 'app\\models\\Workprofile', 46, 1, 0, '2020-04-02 17:51:15', '2020-04-02 17:51:15', NULL),
(3185, 'Created new Doctorspecialization ', 'app\\models\\Doctorspecialization', 76, 1, 0, '2020-04-02 17:51:15', '2020-04-02 17:51:15', NULL),
(3186, 'Created new Doctorspecialization ', 'app\\models\\Doctorspecialization', 77, 1, 0, '2020-04-02 17:51:15', '2020-04-02 17:51:15', NULL),
(3187, 'Created new Doctorspecialization ', 'app\\models\\Doctorspecialization', 78, 1, 0, '2020-04-02 17:51:15', '2020-04-02 17:51:15', NULL),
(3188, 'Created new Doctor Language ', 'app\\models\\DoctorLanguage', 19, 1, 0, '2020-04-02 17:51:15', '2020-04-02 17:51:15', NULL),
(3189, 'Created new Doctor Language ', 'app\\models\\DoctorLanguage', 20, 1, 0, '2020-04-02 17:51:15', '2020-04-02 17:51:15', NULL),
(3190, 'Created new Doctor Language ', 'app\\models\\DoctorLanguage', 21, 1, 0, '2020-04-02 17:51:15', '2020-04-02 17:51:15', NULL),
(3191, 'Created new Login History ', 'app\\models\\LoginHistory', 252, 1, 0, '2020-04-02 17:51:27', '2020-04-02 17:51:27', NULL),
(3192, 'Modified User ', 'app\\models\\User', 201, 1, 0, '2020-04-02 17:51:27', '2020-04-02 17:51:27', 201),
(3193, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 223, 1, 0, '2020-04-02 17:51:27', '2020-04-02 17:51:27', 201),
(3194, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 112, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3195, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 128, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3196, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 113, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3197, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 129, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3198, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 114, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3199, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 130, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3200, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 115, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3201, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 131, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3202, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 116, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3203, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 132, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3204, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 117, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3205, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 133, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3206, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 118, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3207, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 134, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3208, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 119, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3209, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 135, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3210, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 120, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3211, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 136, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3212, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 121, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3213, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 137, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3214, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 122, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3215, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 138, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3216, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 123, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3217, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 139, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3218, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 124, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3219, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 140, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3220, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 125, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3221, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 141, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3222, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 126, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3223, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 142, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3224, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 127, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3225, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 143, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3226, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 128, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3227, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 144, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3228, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 129, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3229, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 145, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3230, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 130, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3231, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 146, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3232, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 131, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3233, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 147, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3234, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 132, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3235, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 148, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201);
INSERT INTO `tbl_feed` (`id`, `content`, `model_type`, `model_id`, `state_id`, `type_id`, `created_on`, `updated_on`, `created_by_id`) VALUES
(3236, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 133, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3237, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 149, 1, 0, '2020-04-02 17:51:51', '2020-04-02 17:51:51', 201),
(3238, 'Modified User ', 'app\\models\\User', 201, 1, 0, '2020-04-02 17:51:56', '2020-04-02 17:51:56', NULL),
(3239, 'Created new User ', 'app\\models\\User', 202, 1, 0, '2020-04-02 17:53:22', '2020-04-02 17:53:22', NULL),
(3240, 'Created new Workprofile ', 'app\\models\\Workprofile', 47, 1, 0, '2020-04-02 17:53:22', '2020-04-02 17:53:22', NULL),
(3241, 'Created new Doctorspecialization ', 'app\\models\\Doctorspecialization', 79, 1, 0, '2020-04-02 17:53:22', '2020-04-02 17:53:22', NULL),
(3242, 'Created new Doctorspecialization ', 'app\\models\\Doctorspecialization', 80, 1, 0, '2020-04-02 17:53:22', '2020-04-02 17:53:22', NULL),
(3243, 'Created new Doctorspecialization ', 'app\\models\\Doctorspecialization', 81, 1, 0, '2020-04-02 17:53:22', '2020-04-02 17:53:22', NULL),
(3244, 'Created new Doctor Language ', 'app\\models\\DoctorLanguage', 22, 1, 0, '2020-04-02 17:53:22', '2020-04-02 17:53:22', NULL),
(3245, 'Created new Doctor Language ', 'app\\models\\DoctorLanguage', 23, 1, 0, '2020-04-02 17:53:22', '2020-04-02 17:53:22', NULL),
(3246, 'Created new Doctor Language ', 'app\\models\\DoctorLanguage', 24, 1, 0, '2020-04-02 17:53:22', '2020-04-02 17:53:22', NULL),
(3247, 'Created new Login History ', 'app\\models\\LoginHistory', 253, 1, 0, '2020-04-02 17:53:28', '2020-04-02 17:53:28', NULL),
(3248, 'Modified User ', 'app\\models\\User', 201, 1, 0, '2020-04-02 17:53:28', '2020-04-02 17:53:28', 201),
(3249, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 224, 1, 0, '2020-04-02 17:53:28', '2020-04-02 17:53:28', 201),
(3250, 'Modified User ', 'app\\models\\User', 201, 1, 0, '2020-04-02 17:53:38', '2020-04-02 17:53:38', NULL),
(3251, 'Created new Login History ', 'app\\models\\LoginHistory', 254, 1, 0, '2020-04-02 17:53:45', '2020-04-02 17:53:45', NULL),
(3252, 'Modified User ', 'app\\models\\User', 202, 1, 0, '2020-04-02 17:53:45', '2020-04-02 17:53:45', 202),
(3253, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 225, 1, 0, '2020-04-02 17:53:45', '2020-04-02 17:53:45', 202),
(3254, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 134, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3255, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 150, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3256, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 135, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3257, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 151, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3258, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 136, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3259, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 152, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3260, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 137, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3261, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 153, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3262, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 138, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3263, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 154, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3264, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 139, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3265, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 155, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3266, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 140, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3267, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 156, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3268, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 141, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3269, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 157, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3270, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 142, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3271, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 158, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3272, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 143, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3273, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 159, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3274, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 144, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3275, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 160, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3276, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 145, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3277, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 161, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3278, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 146, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3279, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 162, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3280, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 147, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3281, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 163, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3282, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 148, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3283, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 164, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3284, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 149, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3285, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 165, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3286, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 150, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3287, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 166, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3288, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 151, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3289, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 167, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3290, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 152, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3291, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 168, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3292, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 153, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3293, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 169, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3294, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 154, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3295, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 170, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3296, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 155, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3297, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 171, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3298, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 156, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3299, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 172, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3300, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 157, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3301, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 173, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3302, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 158, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3303, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 174, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3304, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 159, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3305, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 175, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3306, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 160, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3307, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 176, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3308, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 161, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3309, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 177, 1, 0, '2020-04-02 17:53:56', '2020-04-02 17:53:56', 202),
(3310, 'Created new Doctor Availability ', 'app\\models\\DoctorAvailability', 162, 1, 0, '2020-04-02 17:53:57', '2020-04-02 17:53:57', 202),
(3311, 'Created new Availability Time ', 'app\\models\\AvailabilityTime', 178, 1, 0, '2020-04-02 17:53:57', '2020-04-02 17:53:57', 202),
(3312, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 225, 1, 0, '2020-04-02 17:55:01', '2020-04-02 17:55:01', 202),
(3313, 'Modified User ', 'app\\models\\User', 202, 1, 0, '2020-04-02 17:55:16', '2020-04-02 17:55:16', NULL),
(3314, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 218, 1, 0, '2020-04-02 17:55:45', '2020-04-02 17:55:45', 179),
(3315, 'Created new Appointment ', 'app\\models\\Appointment', 11, 1, 0, '2020-04-02 17:56:12', '2020-04-02 17:56:12', 179),
(3316, 'Created new Notification ', 'app\\modules\\notification\\models\\Notification', 21, 1, 0, '2020-04-02 17:56:12', '2020-04-02 17:56:12', 179),
(3317, 'Created new Notification ', 'app\\modules\\notification\\models\\Notification', 22, 1, 0, '2020-04-02 17:56:12', '2020-04-02 17:56:12', 179),
(3318, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 218, 1, 0, '2020-04-02 17:57:20', '2020-04-02 17:57:20', 179),
(3319, 'Created new Login History ', 'app\\models\\LoginHistory', 255, 1, 0, '2020-04-02 17:58:32', '2020-04-02 17:58:32', NULL),
(3320, 'Modified User ', 'app\\models\\User', 201, 1, 0, '2020-04-02 17:58:32', '2020-04-02 17:58:32', 201),
(3321, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 226, 1, 0, '2020-04-02 17:58:32', '2020-04-02 17:58:32', 201),
(3322, 'Created new Doctor Consultation Availability ', 'app\\models\\DoctorConsultationAvailability', 11, 1, 0, '2020-04-02 17:58:35', '2020-04-02 17:58:35', 201),
(3323, 'Modified User ', 'app\\models\\User', 201, 1, 0, '2020-04-02 17:59:52', '2020-04-02 17:59:52', NULL),
(3324, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 218, 1, 0, '2020-04-02 17:59:59', '2020-04-02 17:59:59', 179),
(3325, 'Created new Login History ', 'app\\models\\LoginHistory', 256, 1, 0, '2020-04-02 18:00:02', '2020-04-02 18:00:02', NULL),
(3326, 'Modified User ', 'app\\models\\User', 202, 1, 0, '2020-04-02 18:00:02', '2020-04-02 18:00:02', 202),
(3327, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 227, 1, 0, '2020-04-02 18:00:02', '2020-04-02 18:00:02', 202),
(3328, 'Created new Doctor Consultation Availability ', 'app\\models\\DoctorConsultationAvailability', 12, 1, 0, '2020-04-02 18:00:06', '2020-04-02 18:00:06', 202),
(3329, 'Created new Appointment ', 'app\\models\\Appointment', 12, 1, 0, '2020-04-02 18:00:26', '2020-04-02 18:00:26', 179),
(3330, 'Created new Notification ', 'app\\modules\\notification\\models\\Notification', 23, 1, 0, '2020-04-02 18:00:26', '2020-04-02 18:00:26', 179),
(3331, 'Created new Notification ', 'app\\modules\\notification\\models\\Notification', 24, 1, 0, '2020-04-02 18:00:26', '2020-04-02 18:00:26', 179),
(3332, 'Created new Appointment ', 'app\\models\\Appointment', 13, 1, 0, '2020-04-02 18:00:39', '2020-04-02 18:00:39', 179),
(3333, 'Created new Notification ', 'app\\modules\\notification\\models\\Notification', 25, 1, 0, '2020-04-02 18:00:39', '2020-04-02 18:00:39', 179),
(3334, 'Created new Notification ', 'app\\modules\\notification\\models\\Notification', 26, 1, 0, '2020-04-02 18:00:39', '2020-04-02 18:00:39', 179),
(3335, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 218, 1, 0, '2020-04-02 18:02:33', '2020-04-02 18:02:33', 179),
(3336, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 218, 1, 0, '2020-04-02 18:04:03', '2020-04-02 18:04:03', 179),
(3337, 'Created new Appointment ', 'app\\models\\Appointment', 14, 1, 0, '2020-04-02 18:04:31', '2020-04-02 18:04:31', 179),
(3338, 'Created new Notification ', 'app\\modules\\notification\\models\\Notification', 27, 1, 0, '2020-04-02 18:04:31', '2020-04-02 18:04:31', 179),
(3339, 'Created new Notification ', 'app\\modules\\notification\\models\\Notification', 28, 1, 0, '2020-04-02 18:04:31', '2020-04-02 18:04:31', 179),
(3340, 'Modified User ', 'app\\models\\User', 202, 1, 0, '2020-04-02 18:05:56', '2020-04-02 18:05:56', NULL),
(3341, 'Created new Login History ', 'app\\models\\LoginHistory', 257, 1, 0, '2020-04-02 18:06:00', '2020-04-02 18:06:00', NULL),
(3342, 'Modified User ', 'app\\models\\User', 201, 1, 0, '2020-04-02 18:06:00', '2020-04-02 18:06:00', 201),
(3343, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 228, 1, 0, '2020-04-02 18:06:00', '2020-04-02 18:06:00', 201),
(3344, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 218, 1, 0, '2020-04-02 18:16:05', '2020-04-02 18:16:05', 179),
(3345, 'Created new Appointment ', 'app\\models\\Appointment', 15, 1, 0, '2020-04-02 18:17:33', '2020-04-02 18:17:33', 179),
(3346, 'Created new Notification ', 'app\\modules\\notification\\models\\Notification', 29, 1, 0, '2020-04-02 18:17:33', '2020-04-02 18:17:33', 179),
(3347, 'Created new Notification ', 'app\\modules\\notification\\models\\Notification', 30, 1, 0, '2020-04-02 18:17:33', '2020-04-02 18:17:33', 179),
(3348, 'Modified Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 216, 1, 0, '2020-04-02 18:25:52', '2020-04-02 18:25:52', 184),
(3349, 'Created new Login History ', 'app\\models\\LoginHistory', 258, 1, 0, '2020-04-02 18:58:48', '2020-04-02 18:58:48', NULL),
(3350, 'Modified User ', 'app\\models\\User', 184, 1, 0, '2020-04-02 18:58:48', '2020-04-02 18:58:48', 184),
(3351, 'Created new Device Detail ', 'app\\modules\\api2\\models\\DeviceDetail', 229, 1, 0, '2020-04-02 18:58:48', '2020-04-02 18:58:48', 184);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feedback`
--

CREATE TABLE `tbl_feedback` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `type_id` int(11) DEFAULT '0',
  `state_id` int(11) NOT NULL DEFAULT '1',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_file`
--

CREATE TABLE `tbl_file` (
  `id` int(11) NOT NULL,
  `title` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `file` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `size` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `model_id` int(11) NOT NULL,
  `model_type` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `state_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_illness`
--

CREATE TABLE `tbl_illness` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `image_file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state_id` int(11) DEFAULT '0',
  `type_id` int(11) DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_illness`
--

INSERT INTO `tbl_illness` (`id`, `title`, `category_id`, `sub_category_id`, `image_file`, `state_id`, `type_id`, `created_on`, `updated_on`, `created_by_id`) VALUES
(3, 'Fever', 1, 1, NULL, 1, 0, '2020-03-30 14:17:54', '2020-03-30 14:17:54', 1),
(4, 'Mood changes', 1, 1, NULL, 1, 0, '2020-03-30 14:18:09', '2020-03-30 14:18:09', 1),
(5, 'headache', 1, 2, NULL, 1, 0, '2020-03-30 14:21:10', '2020-03-30 14:21:10', 1),
(6, 'survical', 1, 2, NULL, 1, 0, '2020-03-30 14:21:36', '2020-03-30 14:21:36', 1),
(7, 'Eys sight', 2, 7, NULL, 1, 0, '2020-03-31 12:21:10', '2020-03-31 12:21:10', 1),
(8, 'Cholestrol', 2, 7, NULL, 1, 0, '2020-03-31 12:21:34', '2020-03-31 12:21:34', 1),
(9, 'Bood infection', 16, 5, NULL, 1, 0, '2020-03-31 12:22:07', '2020-03-31 12:22:07', 1),
(10, 'Itching and skin color', 16, 6, NULL, 1, 0, '2020-03-31 12:23:04', '2020-03-31 12:23:04', 1),
(11, 'BP', 2, 4, NULL, 1, 0, '2020-03-31 12:33:08', '2020-03-31 12:33:08', 1),
(12, 'ChestPain', 2, 4, NULL, 1, 0, '2020-03-31 12:33:39', '2020-03-31 12:33:39', 1),
(13, 'Snizzles', 16, 5, NULL, 1, 0, '2020-03-31 12:33:54', '2020-03-31 12:33:54', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_language_list`
--

CREATE TABLE `tbl_language_list` (
  `id` int(11) NOT NULL,
  `value` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_language_list`
--

INSERT INTO `tbl_language_list` (`id`, `value`, `code`, `type_id`, `state_id`) VALUES
(1, 'Abkhazian', 'ab', 1, 1),
(2, 'Achinese', 'ace', 1, 1),
(3, 'Acoli', 'ach', 1, 1),
(4, 'Adangme', 'ada', 1, 1),
(5, 'Adyghe', 'ady', 1, 1),
(6, 'Afar', 'aa', 1, 1),
(7, 'Afrihili', 'afh', 1, 1),
(8, 'Afrikaans', 'af', 1, 1),
(9, 'Aghem', 'agq', 1, 1),
(10, 'Ainu', 'ain', 1, 1),
(11, 'Akan', 'ak', 1, 1),
(12, 'Akkadian', 'akk', 1, 1),
(13, 'Akoose', 'bss', 1, 1),
(14, 'Alabama', 'akz', 1, 1),
(15, 'Albanian', 'sq', 1, 1),
(16, 'Aleut', 'ale', 1, 1),
(17, 'Algerian Arabic', 'arq', 1, 1),
(18, 'Amarik', 'am', 1, 1),
(19, 'American English', 'en_US', 1, 1),
(20, 'American Sign Language', 'ase', 1, 1),
(21, 'Ancient Egyptian', 'egy', 1, 1),
(22, 'Ancient Greek', 'grc', 1, 1),
(23, 'Angika', 'anp', 1, 1),
(24, 'Ao Naga', 'njo', 1, 1),
(25, 'Arabik', 'ar', 1, 1),
(26, 'Aragonese', 'an', 1, 1),
(27, 'Aramaic', 'arc', 1, 1),
(28, 'Araona', 'aro', 1, 1),
(29, 'Arapaho', 'arp', 1, 1),
(30, 'Arawak', 'arw', 1, 1),
(31, 'Armenian', 'hy', 1, 1),
(32, 'Aromanian', 'rup', 1, 1),
(33, 'Arpitan', 'frp', 1, 1),
(34, 'Assamese', 'as', 1, 1),
(35, 'Asturian', 'ast', 1, 1),
(36, 'Asu', 'asa', 1, 1),
(37, 'Atsam', 'cch', 1, 1),
(38, 'Australian English', 'en_AU', 1, 1),
(39, 'Austrian German', 'de_AT', 1, 1),
(40, 'Avaric', 'av', 1, 1),
(41, 'Avestan', 'ae', 1, 1),
(42, 'Awadhi', 'awa', 1, 1),
(43, 'Aymara', 'ay', 1, 1),
(44, 'Azerbaijani', 'az', 1, 1),
(45, 'Badaga', 'bfq', 1, 1),
(46, 'Bafia', 'ksf', 1, 1),
(47, 'Bafut', 'bfd', 1, 1),
(48, 'Bakhtiari', 'bqi', 1, 1),
(49, 'Balinese', 'ban', 1, 1),
(50, 'Baluchi', 'bal', 1, 1),
(51, 'Bambara', 'bm', 1, 1),
(52, 'Bamun', 'bax', 1, 1),
(53, 'Banjar', 'bjn', 1, 1),
(54, 'Basaa', 'bas', 1, 1),
(55, 'Bashkir', 'ba', 1, 1),
(56, 'Basque', 'eu', 1, 1),
(57, 'Batak Toba', 'bbc', 1, 1),
(58, 'Bavarian', 'bar', 1, 1),
(59, 'Beja', 'bej', 1, 1),
(60, 'Belarus kasa', 'be', 1, 1),
(61, 'Bemba', 'bem', 1, 1),
(62, 'Bena', 'bez', 1, 1),
(63, 'Bengali kasa', 'bn', 1, 1),
(64, 'Betawi', 'bew', 1, 1),
(65, 'Bɛɛmis kasa', 'my', 1, 1),
(66, 'Bhojpuri', 'bho', 1, 1),
(67, 'Bikol', 'bik', 1, 1),
(68, 'Bini', 'bin', 1, 1),
(69, 'Bishnupriya', 'bpy', 1, 1),
(70, 'Bislama', 'bi', 1, 1),
(71, 'Blin', 'byn', 1, 1),
(72, 'Blissymbols', 'zbl', 1, 1),
(73, 'Bodo', 'brx', 1, 1),
(74, 'Borɔfo', 'en', 1, 1),
(75, 'Bosnian', 'bs', 1, 1),
(76, 'Bɔlgeria kasa', 'bg', 1, 1),
(77, 'Brahui', 'brh', 1, 1),
(78, 'Braj', 'bra', 1, 1),
(79, 'Brazilian Portuguese', 'pt_BR', 1, 1),
(80, 'Breton', 'br', 1, 1),
(81, 'British English', 'en_GB', 1, 1),
(82, 'Buginese', 'bug', 1, 1),
(83, 'Bulu', 'bum', 1, 1),
(84, 'Buriat', 'bua', 1, 1),
(85, 'Caddo', 'cad', 1, 1),
(86, 'Cajun French', 'frc', 1, 1),
(87, 'Canadian English', 'en_CA', 1, 1),
(88, 'Canadian French', 'fr_CA', 1, 1),
(89, 'Cantonese', 'yue', 1, 1),
(90, 'Capiznon', 'cps', 1, 1),
(91, 'Carib', 'car', 1, 1),
(92, 'Catalan', 'ca', 1, 1),
(93, 'Cayuga', 'cay', 1, 1),
(94, 'Cebuano', 'ceb', 1, 1),
(95, 'Central Atlas Tamazight', 'tzm', 1, 1),
(96, 'Central Dusun', 'dtp', 1, 1),
(97, 'Central Kurdish', 'ckb', 1, 1),
(98, 'Central Yupik', 'esu', 1, 1),
(99, 'Chadian Arabic', 'shu', 1, 1),
(100, 'Chagatai', 'chg', 1, 1),
(101, 'Chamorro', 'ch', 1, 1),
(102, 'Chechen', 'ce', 1, 1),
(103, 'Cherokee', 'chr', 1, 1),
(104, 'Cheyenne', 'chy', 1, 1),
(105, 'Chibcha', 'chb', 1, 1),
(106, 'Chiga', 'cgg', 1, 1),
(107, 'Chimborazo Highland Quichua', 'qug', 1, 1),
(108, 'Chinook Jargon', 'chn', 1, 1),
(109, 'Chipewyan', 'chp', 1, 1),
(110, 'Choctaw', 'cho', 1, 1),
(111, 'Church Slavic', 'cu', 1, 1),
(112, 'Chuukese', 'chk', 1, 1),
(113, 'Chuvash', 'cv', 1, 1),
(114, 'Classical Newari', 'nwc', 1, 1),
(115, 'Classical Syriac', 'syc', 1, 1),
(116, 'Colognian', 'ksh', 1, 1),
(117, 'Comorian', 'swb', 1, 1),
(118, 'Congo Swahili', 'swc', 1, 1),
(119, 'Coptic', 'cop', 1, 1),
(120, 'Cornish', 'kw', 1, 1),
(121, 'Corsican', 'co', 1, 1),
(122, 'Cree', 'cr', 1, 1),
(123, 'Creek', 'mus', 1, 1),
(124, 'Crimean Turkish', 'crh', 1, 1),
(125, 'Croatian', 'hr', 1, 1),
(126, 'Dakota', 'dak', 1, 1),
(127, 'Danish', 'da', 1, 1),
(128, 'Dargwa', 'dar', 1, 1),
(129, 'Dazaga', 'dzg', 1, 1),
(130, 'Delaware', 'del', 1, 1),
(131, 'Dɛɛkye', 'nl', 1, 1),
(132, 'Dinka', 'din', 1, 1),
(133, 'Divehi', 'dv', 1, 1),
(134, 'Dogri', 'doi', 1, 1),
(135, 'Dogrib', 'dgr', 1, 1),
(136, 'Duala', 'dua', 1, 1),
(137, 'Dyula', 'dyu', 1, 1),
(138, 'Dzongkha', 'dz', 1, 1),
(139, 'Eastern Frisian', 'frs', 1, 1),
(140, 'Efik', 'efi', 1, 1),
(141, 'Egyptian Arabic', 'arz', 1, 1),
(142, 'Ekajuk', 'eka', 1, 1),
(143, 'Elamite', 'elx', 1, 1),
(144, 'Embu', 'ebu', 1, 1),
(145, 'Emilian', 'egl', 1, 1),
(146, 'Erzya', 'myv', 1, 1),
(147, 'Esperanto', 'eo', 1, 1),
(148, 'Estonian', 'et', 1, 1),
(149, 'European Portuguese', 'pt_PT', 1, 1),
(150, 'European Spanish', 'es_ES', 1, 1),
(151, 'Ewe', 'ee', 1, 1),
(152, 'Ewondo', 'ewo', 1, 1),
(153, 'Extremaduran', 'ext', 1, 1),
(154, 'Fang', 'fan', 1, 1),
(155, 'Fanti', 'fat', 1, 1),
(156, 'Faroese', 'fo', 1, 1),
(157, 'Fiji Hindi', 'hif', 1, 1),
(158, 'Fijian', 'fj', 1, 1),
(159, 'Filipino', 'fil', 1, 1),
(160, 'Finnish', 'fi', 1, 1),
(161, 'Flemish', 'nl_BE', 1, 1),
(162, 'Fon', 'fon', 1, 1),
(163, 'Frafra', 'gur', 1, 1),
(164, 'Frɛnkye', 'fr', 1, 1),
(165, 'Friulian', 'fur', 1, 1),
(166, 'Fulah', 'ff', 1, 1),
(167, 'Ga', 'gaa', 1, 1),
(168, 'Gagauz', 'gag', 1, 1),
(169, 'Galician', 'gl', 1, 1),
(170, 'Gan Chinese', 'gan', 1, 1),
(171, 'Ganda', 'lg', 1, 1),
(172, 'Gayo', 'gay', 1, 1),
(173, 'Gbaya', 'gba', 1, 1),
(174, 'Geez', 'gez', 1, 1),
(175, 'Georgian', 'ka', 1, 1),
(176, 'Gheg Albanian', 'aln', 1, 1),
(177, 'Ghomala', 'bbj', 1, 1),
(178, 'Gilaki', 'glk', 1, 1),
(179, 'Gilbertese', 'gil', 1, 1),
(180, 'Goan Konkani', 'gom', 1, 1),
(181, 'Gondi', 'gon', 1, 1),
(182, 'Gorontalo', 'gor', 1, 1),
(183, 'Gothic', 'got', 1, 1),
(184, 'Grebo', 'grb', 1, 1),
(185, 'Greek kasa', 'el', 1, 1),
(186, 'Guarani', 'gn', 1, 1),
(187, 'Gujarati', 'gu', 1, 1),
(188, 'Gusii', 'guz', 1, 1),
(189, 'Gwichʼin', 'gwi', 1, 1),
(190, 'Gyaaman', 'de', 1, 1),
(191, 'Gyabanis kasa', 'jv', 1, 1),
(192, 'Gyapan kasa', 'ja', 1, 1),
(193, 'Hacodea', 'hai', 1, 1),
(194, 'Haitian', 'ht', 1, 1),
(195, 'Hakka Chinese', 'hak', 1, 1),
(196, 'Hangri kasa', 'hu', 1, 1),
(197, 'Hausa', 'ha', 1, 1),
(198, 'Hawaiian', 'haw', 1, 1),
(199, 'Hebrew', 'he', 1, 1),
(200, 'Herero', 'hz', 1, 1),
(201, 'Hiligaynon', 'hil', 1, 1),
(202, 'Hindi', 'hi', 1, 1),
(203, 'Hiri Motu', 'ho', 1, 1),
(204, 'Hittite', 'hit', 1, 1),
(205, 'Hmong', 'hmn', 1, 1),
(206, 'Hupa', 'hup', 1, 1),
(207, 'Iban', 'iba', 1, 1),
(208, 'Ibibio', 'ibb', 1, 1),
(209, 'Icelandic', 'is', 1, 1),
(210, 'codeo', 'io', 1, 1),
(211, 'Igbo', 'ig', 1, 1),
(212, 'Iloko', 'ilo', 1, 1),
(213, 'Inari Sami', 'smn', 1, 1),
(214, 'Indonihyia kasa', 'code', 1, 1),
(215, 'Ingrian', 'izh', 1, 1),
(216, 'Ingush', 'inh', 1, 1),
(217, 'Interlingua', 'ia', 1, 1),
(218, 'Interlingue', 'ie', 1, 1),
(219, 'Inuktitut', 'iu', 1, 1),
(220, 'Inupiaq', 'ik', 1, 1),
(221, 'Irish', 'ga', 1, 1),
(222, 'Italy kasa', 'it', 1, 1),
(223, 'Jamaican Creole English', 'jam', 1, 1),
(224, 'Jju', 'kaj', 1, 1),
(225, 'Jola-Fonyi', 'dyo', 1, 1),
(226, 'Judeo-Arabic', 'jrb', 1, 1),
(227, 'Judeo-Persian', 'jpr', 1, 1),
(228, 'Jutish', 'jut', 1, 1),
(229, 'Kabardian', 'kbd', 1, 1),
(230, 'Kabuverdianu', 'kea', 1, 1),
(231, 'Kabyle', 'kab', 1, 1),
(232, 'Kachin', 'kac', 1, 1),
(233, 'Kaingang', 'kgp', 1, 1),
(234, 'Kako', 'kkj', 1, 1),
(235, 'Kalaallisut', 'kl', 1, 1),
(236, 'Kalenjin', 'kln', 1, 1),
(237, 'Kalmyk', 'xal', 1, 1),
(238, 'Kamba', 'kam', 1, 1),
(239, 'Kambodia kasa', 'km', 1, 1),
(240, 'Kanembu', 'kbl', 1, 1),
(241, 'Kannada', 'kn', 1, 1),
(242, 'Kanuri', 'kr', 1, 1),
(243, 'Kara-Kalpak', 'kaa', 1, 1),
(244, 'Karachay-Balkar', 'krc', 1, 1),
(245, 'Karelian', 'krl', 1, 1),
(246, 'Kashmiri', 'ks', 1, 1),
(247, 'Kashubian', 'csb', 1, 1),
(248, 'Kawi', 'kaw', 1, 1),
(249, 'Kazakh', 'kk', 1, 1),
(250, 'Kenyang', 'ken', 1, 1),
(251, 'Khasi', 'kha', 1, 1),
(252, 'Khotanese', 'kho', 1, 1),
(253, 'Khowar', 'khw', 1, 1),
(254, 'Kikuyu', 'ki', 1, 1),
(255, 'Kimbundu', 'kmb', 1, 1),
(256, 'Kinaray-a', 'krj', 1, 1),
(257, 'Kirmanjki', 'kiu', 1, 1),
(258, 'Klingon', 'tlh', 1, 1),
(259, 'Kom', 'bkm', 1, 1),
(260, 'Komi', 'kv', 1, 1),
(261, 'Komi-Permyak', 'koi', 1, 1),
(262, 'Kongo', 'kg', 1, 1),
(263, 'Konkani', 'kok', 1, 1),
(264, 'Korea kasa', 'ko', 1, 1),
(265, 'Koro', 'kfo', 1, 1),
(266, 'Kosraean', 'kos', 1, 1),
(267, 'Kotava', 'avk', 1, 1),
(268, 'Koyra Chiini', 'khq', 1, 1),
(269, 'Koyraboro Senni', 'ses', 1, 1),
(270, 'Kpelle', 'kpe', 1, 1),
(271, 'Krio', 'kri', 1, 1),
(272, 'Kuanyama', 'kj', 1, 1),
(273, 'Kumyk', 'kum', 1, 1),
(274, 'Kurdish', 'ku', 1, 1),
(275, 'Kurukh', 'kru', 1, 1),
(276, 'Kutenai', 'kut', 1, 1),
(277, 'Kwasio', 'nmg', 1, 1),
(278, 'Kyaena kasa', 'zh', 1, 1),
(279, 'Kyɛk kasa', 'cs', 1, 1),
(280, 'Kyrgyz', 'ky', 1, 1),
(281, 'Kʼicheʼ', 'quc', 1, 1),
(282, 'Ladino', 'lad', 1, 1),
(283, 'Lahnda', 'lah', 1, 1),
(284, 'Lakota', 'lkt', 1, 1),
(285, 'Lamba', 'lam', 1, 1),
(286, 'Langi', 'lag', 1, 1),
(287, 'Lao', 'lo', 1, 1),
(288, 'Latgalian', 'ltg', 1, 1),
(289, 'Latin', 'la', 1, 1),
(290, 'Latin American Spanish', 'es_419', 1, 1),
(291, 'Latvian', 'lv', 1, 1),
(292, 'Laz', 'lzz', 1, 1),
(293, 'Lezghian', 'lez', 1, 1),
(294, 'Ligurian', 'lij', 1, 1),
(295, 'Limburgish', 'li', 1, 1),
(296, 'Lingala', 'ln', 1, 1),
(297, 'Lingua Franca Nova', 'lfn', 1, 1),
(298, 'Literary Chinese', 'lzh', 1, 1),
(299, 'Lithuanian', 'lt', 1, 1),
(300, 'Livonian', 'liv', 1, 1),
(301, 'Lojban', 'jbo', 1, 1),
(302, 'Lombard', 'lmo', 1, 1),
(303, 'Low German', 'nds', 1, 1),
(304, 'Lower Silesian', 'sli', 1, 1),
(305, 'Lower Sorbian', 'dsb', 1, 1),
(306, 'Lozi', 'loz', 1, 1),
(307, 'Luba-Katanga', 'lu', 1, 1),
(308, 'Luba-Lulua', 'lua', 1, 1),
(309, 'Luiseno', 'lui', 1, 1),
(310, 'Lule Sami', 'smj', 1, 1),
(311, 'Lunda', 'lun', 1, 1),
(312, 'Luo', 'luo', 1, 1),
(313, 'Luxembourgish', 'lb', 1, 1),
(314, 'Luyia', 'luy', 1, 1),
(315, 'Maba', 'mde', 1, 1),
(316, 'Macedonian', 'mk', 1, 1),
(317, 'Machame', 'jmc', 1, 1),
(318, 'Madurese', 'mad', 1, 1),
(319, 'Mafa', 'maf', 1, 1),
(320, 'Magahi', 'mag', 1, 1),
(321, 'Main-Franconian', 'vmf', 1, 1),
(322, 'Maithili', 'mai', 1, 1),
(323, 'Makasar', 'mak', 1, 1),
(324, 'Makhuwa-Meetto', 'mgh', 1, 1),
(325, 'Makonde', 'kde', 1, 1),
(326, 'Malagasy', 'mg', 1, 1),
(327, 'Malay kasa', 'ms', 1, 1),
(328, 'Malayalam', 'ml', 1, 1),
(329, 'Maltese', 'mt', 1, 1),
(330, 'Manchu', 'mnc', 1, 1),
(331, 'Mandar', 'mdr', 1, 1),
(332, 'Mandingo', 'man', 1, 1),
(333, 'Manipuri', 'mni', 1, 1),
(334, 'Manx', 'gv', 1, 1),
(335, 'Maori', 'mi', 1, 1),
(336, 'Mapuche', 'arn', 1, 1),
(337, 'Marathi', 'mr', 1, 1),
(338, 'Mari', 'chm', 1, 1),
(339, 'Marshallese', 'mh', 1, 1),
(340, 'Marwari', 'mwr', 1, 1),
(341, 'Masai', 'mas', 1, 1),
(342, 'Mazanderani', 'mzn', 1, 1),
(343, 'Medumba', 'byv', 1, 1),
(344, 'Mende', 'men', 1, 1),
(345, 'Mentawai', 'mwv', 1, 1),
(346, 'Meru', 'mer', 1, 1),
(347, 'Metaʼ', 'mgo', 1, 1),
(348, 'Mexican Spanish', 'es_MX', 1, 1),
(349, 'Micmac', 'mic', 1, 1),
(350, 'Mcodedle Dutch', 'dum', 1, 1),
(351, 'Mcodedle English', 'enm', 1, 1),
(352, 'Mcodedle French', 'frm', 1, 1),
(353, 'Mcodedle High German', 'gmh', 1, 1),
(354, 'Mcodedle Irish', 'mga', 1, 1),
(355, 'Min Nan Chinese', 'nan', 1, 1),
(356, 'Minangkabau', 'min', 1, 1),
(357, 'Mingrelian', 'xmf', 1, 1),
(358, 'Mirandese', 'mwl', 1, 1),
(359, 'Mizo', 'lus', 1, 1),
(360, 'Modern Standard Arabic', 'ar_001', 1, 1),
(361, 'Mohawk', 'moh', 1, 1),
(362, 'Moksha', 'mdf', 1, 1),
(363, 'Moldavian', 'ro_MD', 1, 1),
(364, 'Mongo', 'lol', 1, 1),
(365, 'Mongolian', 'mn', 1, 1),
(366, 'Morisyen', 'mfe', 1, 1),
(367, 'Moroccan Arabic', 'ary', 1, 1),
(368, 'Mossi', 'mos', 1, 1),
(369, 'Multiple Languages', 'mul', 1, 1),
(370, 'Mundang', 'mua', 1, 1),
(371, 'Muslim Tat', 'ttt', 1, 1),
(372, 'Myene', 'mye', 1, 1),
(373, 'Nama', 'naq', 1, 1),
(374, 'Nauru', 'na', 1, 1),
(375, 'Navajo', 'nv', 1, 1),
(376, 'Ndonga', 'ng', 1, 1),
(377, 'Neapolitan', 'nap', 1, 1),
(378, 'Newari', 'new', 1, 1),
(379, 'Nɛpal kasa', 'ne', 1, 1),
(380, 'Ngambay', 'sba', 1, 1),
(381, 'Ngiemboon', 'nnh', 1, 1),
(382, 'Ngomba', 'jgo', 1, 1),
(383, 'Nheengatu', 'yrl', 1, 1),
(384, 'Nias', 'nia', 1, 1),
(385, 'Niuean', 'niu', 1, 1),
(386, 'No linguistic content', 'zxx', 1, 1),
(387, 'Nogai', 'nog', 1, 1),
(388, 'North Ndebele', 'nd', 1, 1),
(389, 'Northern Frisian', 'frr', 1, 1),
(390, 'Northern Sami', 'se', 1, 1),
(391, 'Northern Sotho', 'nso', 1, 1),
(392, 'Norwegian', 'no', 1, 1),
(393, 'Norwegian Bokmål', 'nb', 1, 1),
(394, 'Norwegian Nynorsk', 'nn', 1, 1),
(395, 'Novial', 'nov', 1, 1),
(396, 'Nuer', 'nus', 1, 1),
(397, 'Nyamwezi', 'nym', 1, 1),
(398, 'Nyanja', 'ny', 1, 1),
(399, 'Nyankole', 'nyn', 1, 1),
(400, 'Nyasa Tonga', 'tog', 1, 1),
(401, 'Nyoro', 'nyo', 1, 1),
(402, 'Nzima', 'nzi', 1, 1),
(403, 'NʼKo', 'nqo', 1, 1),
(404, 'Occitan', 'oc', 1, 1),
(405, 'Ojibwa', 'oj', 1, 1),
(406, 'Old English', 'ang', 1, 1),
(407, 'Old French', 'fro', 1, 1),
(408, 'Old High German', 'goh', 1, 1),
(409, 'Old Irish', 'sga', 1, 1),
(410, 'Old Norse', 'non', 1, 1),
(411, 'Old Persian', 'peo', 1, 1),
(412, 'Old Provençal', 'pro', 1, 1),
(413, 'Oriya', 'or', 1, 1),
(414, 'Oromo', 'om', 1, 1),
(415, 'Osage', 'osa', 1, 1),
(416, 'Ossetic', 'os', 1, 1),
(417, 'Ottoman Turkish', 'ota', 1, 1),
(418, 'Pahlavi', 'pal', 1, 1),
(419, 'Palatine German', 'pfl', 1, 1),
(420, 'Palauan', 'pau', 1, 1),
(421, 'Pali', 'pi', 1, 1),
(422, 'Pampanga', 'pam', 1, 1),
(423, 'Pangasinan', 'pag', 1, 1),
(424, 'Papiamento', 'pap', 1, 1),
(425, 'Pashto', 'ps', 1, 1),
(426, 'Pennsylvania German', 'pdc', 1, 1),
(427, 'Pɛɛhyia kasa', 'fa', 1, 1),
(428, 'Phoenician', 'phn', 1, 1),
(429, 'Picard', 'pcd', 1, 1),
(430, 'Piedmontese', 'pms', 1, 1),
(431, 'Plautdietsch', 'pdt', 1, 1),
(432, 'Pohnpeian', 'pon', 1, 1),
(433, 'Pontic', 'pnt', 1, 1),
(434, 'Pɔland kasa', 'pl', 1, 1),
(435, 'Pɔɔtugal kasa', 'pt', 1, 1),
(436, 'Prussian', 'prg', 1, 1),
(437, 'Pungyabi kasa', 'pa', 1, 1),
(438, 'Quechua', 'qu', 1, 1),
(439, 'Rahyia kasa', 'ru', 1, 1),
(440, 'Rajasthani', 'raj', 1, 1),
(441, 'Rapanui', 'rap', 1, 1),
(442, 'Rarotongan', 'rar', 1, 1),
(443, 'Rewanda kasa', 'rw', 1, 1),
(444, 'Riffian', 'rif', 1, 1),
(445, 'Romagnol', 'rgn', 1, 1),
(446, 'Romansh', 'rm', 1, 1),
(447, 'Romany', 'rom', 1, 1),
(448, 'Rombo', 'rof', 1, 1),
(449, 'Romenia kasa', 'ro', 1, 1),
(450, 'Root', 'root', 1, 1),
(451, 'Rotuman', 'rtm', 1, 1),
(452, 'Roviana', 'rug', 1, 1),
(453, 'Rundi', 'rn', 1, 1),
(454, 'Rusyn', 'rue', 1, 1),
(455, 'Rwa', 'rwk', 1, 1),
(456, 'Saho', 'ssy', 1, 1),
(457, 'Sakha', 'sah', 1, 1),
(458, 'Samaritan Aramaic', 'sam', 1, 1),
(459, 'Samburu', 'saq', 1, 1),
(460, 'Samoan', 'sm', 1, 1),
(461, 'Samogitian', 'sgs', 1, 1),
(462, 'Sandawe', 'sad', 1, 1),
(463, 'Sango', 'sg', 1, 1),
(464, 'Sangu', 'sbp', 1, 1),
(465, 'Sanskrit', 'sa', 1, 1),
(466, 'Santali', 'sat', 1, 1),
(467, 'Sardinian', 'sc', 1, 1),
(468, 'Sasak', 'sas', 1, 1),
(469, 'Sassarese Sardinian', 'sdc', 1, 1),
(470, 'Saterland Frisian', 'stq', 1, 1),
(471, 'Saurashtra', 'saz', 1, 1),
(472, 'Scots', 'sco', 1, 1),
(473, 'Scottish Gaelic', 'gd', 1, 1),
(474, 'Selayar', 'sly', 1, 1),
(475, 'Selkup', 'sel', 1, 1),
(476, 'Sena', 'seh', 1, 1),
(477, 'Seneca', 'see', 1, 1),
(478, 'Serbian', 'sr', 1, 1),
(479, 'Serbo-Croatian', 'sh', 1, 1),
(480, 'Serer', 'srr', 1, 1),
(481, 'Seri', 'sei', 1, 1),
(482, 'Shambala', 'ksb', 1, 1),
(483, 'Shan', 'shn', 1, 1),
(484, 'Shona', 'sn', 1, 1),
(485, 'Sichuan Yi', 'ii', 1, 1),
(486, 'Sicilian', 'scn', 1, 1),
(487, 'Scodeamo', 'scode', 1, 1),
(488, 'Siksika', 'bla', 1, 1),
(489, 'Silesian', 'szl', 1, 1),
(490, 'Simplified Chinese', 'zh_Hans', 1, 1),
(491, 'Sindhi', 'sd', 1, 1),
(492, 'Sinhala', 'si', 1, 1),
(493, 'Skolt Sami', 'sms', 1, 1),
(494, 'Slave', 'den', 1, 1),
(495, 'Slovak', 'sk', 1, 1),
(496, 'Slovenian', 'sl', 1, 1),
(497, 'Soga', 'xog', 1, 1),
(498, 'Sogdien', 'sog', 1, 1),
(499, 'Somalia kasa', 'so', 1, 1),
(500, 'Soninke', 'snk', 1, 1),
(501, 'South Azerbaijani', 'azb', 1, 1),
(502, 'South Ndebele', 'nr', 1, 1),
(503, 'Southern Altai', 'alt', 1, 1),
(504, 'Southern Sami', 'sma', 1, 1),
(505, 'Southern Sotho', 'st', 1, 1),
(506, 'Spain kasa', 'es', 1, 1),
(507, 'Sranan Tongo', 'srn', 1, 1),
(508, 'Standard Moroccan Tamazight', 'zgh', 1, 1),
(509, 'Sukuma', 'suk', 1, 1),
(510, 'Sumerian', 'sux', 1, 1),
(511, 'Sundanese', 'su', 1, 1),
(512, 'Susu', 'sus', 1, 1),
(513, 'Swahili', 'sw', 1, 1),
(514, 'Swati', 'ss', 1, 1),
(515, 'Sweden kasa', 'sv', 1, 1),
(516, 'Swiss French', 'fr_CH', 1, 1),
(517, 'Swiss German', 'gsw', 1, 1),
(518, 'Swiss High German', 'de_CH', 1, 1),
(519, 'Syriac', 'syr', 1, 1),
(520, 'Tachelhit', 'shi', 1, 1),
(521, 'Taeland kasa', 'th', 1, 1),
(522, 'Tagalog', 'tl', 1, 1),
(523, 'Tahitian', 'ty', 1, 1),
(524, 'Taita', 'dav', 1, 1),
(525, 'Tajik', 'tg', 1, 1),
(526, 'Talysh', 'tly', 1, 1),
(527, 'Tamashek', 'tmh', 1, 1),
(528, 'Tamil kasa', 'ta', 1, 1),
(529, 'Taroko', 'trv', 1, 1),
(530, 'Tasawaq', 'twq', 1, 1),
(531, 'Tatar', 'tt', 1, 1),
(532, 'Telugu', 'te', 1, 1),
(533, 'Tereno', 'ter', 1, 1),
(534, 'Teso', 'teo', 1, 1),
(535, 'Tetum', 'tet', 1, 1),
(536, 'Tɛɛki kasa', 'tr', 1, 1),
(537, 'Tibetan', 'bo', 1, 1),
(538, 'Tigre', 'tig', 1, 1),
(539, 'Tigrinya', 'ti', 1, 1),
(540, 'Timne', 'tem', 1, 1),
(541, 'Tiv', 'tiv', 1, 1),
(542, 'Tlingit', 'tli', 1, 1),
(543, 'Tok Pisin', 'tpi', 1, 1),
(544, 'Tokelau', 'tkl', 1, 1),
(545, 'Tongan', 'to', 1, 1),
(546, 'Tornedalen Finnish', 'fit', 1, 1),
(547, 'Traditional Chinese', 'zh_Hant', 1, 1),
(548, 'Tsakhur', 'tkr', 1, 1),
(549, 'Tsakonian', 'tsd', 1, 1),
(550, 'Tsimshian', 'tsi', 1, 1),
(551, 'Tsonga', 'ts', 1, 1),
(552, 'Tswana', 'tn', 1, 1),
(553, 'Tulu', 'tcy', 1, 1),
(554, 'Tumbuka', 'tum', 1, 1),
(555, 'Tunisian Arabic', 'aeb', 1, 1),
(556, 'Turkmen', 'tk', 1, 1),
(557, 'Turoyo', 'tru', 1, 1),
(558, 'Tuvalu', 'tvl', 1, 1),
(559, 'Tuvinian', 'tyv', 1, 1),
(560, 'Twi', 'tw', 1, 1),
(561, 'Tyap', 'kcg', 1, 1),
(562, 'Udmurt', 'udm', 1, 1),
(563, 'Ugaritic', 'uga', 1, 1),
(564, 'Ukren kasa', 'uk', 1, 1),
(565, 'Umbundu', 'umb', 1, 1),
(566, 'Unknown Language', 'und', 1, 1),
(567, 'Upper Sorbian', 'hsb', 1, 1),
(568, 'Urdu kasa', 'ur', 1, 1),
(569, 'Uyghur', 'ug', 1, 1),
(570, 'Uzbek', 'uz', 1, 1),
(571, 'Vai', 'vai', 1, 1),
(572, 'Venda', 've', 1, 1),
(573, 'Venetian', 'vec', 1, 1),
(574, 'Veps', 'vep', 1, 1),
(575, 'Viɛtnam kasa', 'vi', 1, 1),
(576, 'Volapük', 'vo', 1, 1),
(577, 'Võro', 'vro', 1, 1),
(578, 'Votic', 'vot', 1, 1),
(579, 'Vunjo', 'vun', 1, 1),
(580, 'Walloon', 'wa', 1, 1),
(581, 'Walser', 'wae', 1, 1),
(582, 'Waray', 'war', 1, 1),
(583, 'Warlpiri', 'wbp', 1, 1),
(584, 'Washo', 'was', 1, 1),
(585, 'Wayuu', 'guc', 1, 1),
(586, 'Welsh', 'cy', 1, 1),
(587, 'West Flemish', 'vls', 1, 1),
(588, 'Western Frisian', 'fy', 1, 1),
(589, 'Western Mari', 'mrj', 1, 1),
(590, 'Wolaytta', 'wal', 1, 1),
(591, 'Wolof', 'wo', 1, 1),
(592, 'Wu Chinese', 'wuu', 1, 1),
(593, 'Xhosa', 'xh', 1, 1),
(594, 'Xiang Chinese', 'hsn', 1, 1),
(595, 'Yangben', 'yav', 1, 1),
(596, 'Yao', 'yao', 1, 1),
(597, 'Yapese', 'yap', 1, 1),
(598, 'Yemba', 'ybb', 1, 1),
(599, 'Ycodedish', 'yi', 1, 1),
(600, 'Yoruba', 'yo', 1, 1),
(601, 'Zapotec', 'zap', 1, 1),
(602, 'Zarma', 'dje', 1, 1),
(603, 'Zaza', 'zza', 1, 1),
(604, 'Zeelandic', 'zea', 1, 1),
(605, 'Zenaga', 'zen', 1, 1),
(606, 'Zhuang', 'za', 1, 1),
(607, 'Zoroastrian Dari', 'gbz', 1, 1),
(608, 'Zulu', 'zu', 1, 1),
(609, 'Zuni', 'zun', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_log`
--

CREATE TABLE `tbl_log` (
  `id` int(11) NOT NULL,
  `error` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `api` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `state_id` int(11) DEFAULT '1',
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type_id` int(11) DEFAULT '0',
  `created_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_log`
--

INSERT INTO `tbl_log` (`id`, `error`, `api`, `description`, `state_id`, `link`, `type_id`, `created_on`) VALUES
(1, 'You are not allowed to perform this action.', '', '#0 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/filters/AccessControl.php(140): yii\\filters\\AccessControl->denyAccess(Object(app\\components\\WebUser))\n#1 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/ActionFilter.php(77): yii\\filters\\AccessControl->beforeAction(Object(yii\\base\\InlineAction))\n#2 [internal function]: yii\\base\\ActionFilter->beforeFilter(Object(yii\\base\\ActionEvent))\n#3 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Component.php(627): call_user_func(Array, Object(yii\\base\\ActionEvent))\n#4 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(276): yii\\base\\Component->trigger(\'beforeAction\', Object(yii\\base\\ActionEvent))\n#5 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Controller.php(185): yii\\base\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#6 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/base/TBaseController.php(74): yii\\web\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#7 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/components/TController.php(231): app\\base\\TBaseController->beforeAction(Object(yii\\base\\InlineAction))\n#8 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(155): app\\components\\TController->beforeAction(Object(yii\\base\\InlineAction))\n#9 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'login\', Array)\n#10 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'user/login\', Array)\n#11 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(app\\components\\TRequest))\n#12 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/index.php(10): yii\\base\\Application->run()\n#13 {main}', 1, '403:  /signal-a-doc/user/login', 0, '2020-03-17 11:51:50'),
(2, 'You are not allowed to perform this action.', '', '#0 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/filters/AccessControl.php(140): yii\\filters\\AccessControl->denyAccess(Object(app\\components\\WebUser))\n#1 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/ActionFilter.php(77): yii\\filters\\AccessControl->beforeAction(Object(yii\\base\\InlineAction))\n#2 [internal function]: yii\\base\\ActionFilter->beforeFilter(Object(yii\\base\\ActionEvent))\n#3 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Component.php(627): call_user_func(Array, Object(yii\\base\\ActionEvent))\n#4 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(276): yii\\base\\Component->trigger(\'beforeAction\', Object(yii\\base\\ActionEvent))\n#5 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Controller.php(185): yii\\base\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#6 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/base/TBaseController.php(74): yii\\web\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#7 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/components/TController.php(231): app\\base\\TBaseController->beforeAction(Object(yii\\base\\InlineAction))\n#8 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(155): app\\components\\TController->beforeAction(Object(yii\\base\\InlineAction))\n#9 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'ajax\', Array)\n#10 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'appointment/aja...\', Array)\n#11 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(app\\components\\TRequest))\n#12 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/index.php(10): yii\\base\\Application->run()\n#13 {main}', 1, '403:  /signal-a-doc/appointment/ajax/173?type=app%5Cmodels%5CUser&function=doctorAppointment&addMenu=1', 0, '2020-03-24 15:31:54'),
(3, 'You are not allowed to perform this action.', '', '#0 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/filters/AccessControl.php(140): yii\\filters\\AccessControl->denyAccess(Object(app\\components\\WebUser))\n#1 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/ActionFilter.php(77): yii\\filters\\AccessControl->beforeAction(Object(yii\\base\\InlineAction))\n#2 [internal function]: yii\\base\\ActionFilter->beforeFilter(Object(yii\\base\\ActionEvent))\n#3 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Component.php(627): call_user_func(Array, Object(yii\\base\\ActionEvent))\n#4 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(276): yii\\base\\Component->trigger(\'beforeAction\', Object(yii\\base\\ActionEvent))\n#5 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Controller.php(185): yii\\base\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#6 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/base/TBaseController.php(74): yii\\web\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#7 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/components/TController.php(231): app\\base\\TBaseController->beforeAction(Object(yii\\base\\InlineAction))\n#8 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(155): app\\components\\TController->beforeAction(Object(yii\\base\\InlineAction))\n#9 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'ajax\', Array)\n#10 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'appointment/aja...\', Array)\n#11 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(app\\components\\TRequest))\n#12 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/index.php(10): yii\\base\\Application->run()\n#13 {main}', 1, '403:  /signal-a-doc/appointment/ajax/175?type=app%5Cmodels%5CUser&function=doctorAppointment&addMenu=1', 0, '2020-03-25 11:55:02'),
(4, 'You are not allowed to perform this action.', '', '#0 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/filters/AccessControl.php(140): yii\\filters\\AccessControl->denyAccess(Object(app\\components\\WebUser))\n#1 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/ActionFilter.php(77): yii\\filters\\AccessControl->beforeAction(Object(yii\\base\\InlineAction))\n#2 [internal function]: yii\\base\\ActionFilter->beforeFilter(Object(yii\\base\\ActionEvent))\n#3 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Component.php(627): call_user_func(Array, Object(yii\\base\\ActionEvent))\n#4 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(276): yii\\base\\Component->trigger(\'beforeAction\', Object(yii\\base\\ActionEvent))\n#5 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Controller.php(185): yii\\base\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#6 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/base/TBaseController.php(74): yii\\web\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#7 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/components/TController.php(231): app\\base\\TBaseController->beforeAction(Object(yii\\base\\InlineAction))\n#8 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(155): app\\components\\TController->beforeAction(Object(yii\\base\\InlineAction))\n#9 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'ajax\', Array)\n#10 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'appointment/aja...\', Array)\n#11 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(app\\components\\TRequest))\n#12 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/index.php(10): yii\\base\\Application->run()\n#13 {main}', 1, '403:  /signal-a-doc/appointment/ajax/175?type=app%5Cmodels%5CUser&function=doctorAppointment&addMenu=1', 0, '2020-03-25 11:55:23'),
(5, 'You are not allowed to perform this action.', '', '#0 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/filters/AccessControl.php(140): yii\\filters\\AccessControl->denyAccess(Object(app\\components\\WebUser))\n#1 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/ActionFilter.php(77): yii\\filters\\AccessControl->beforeAction(Object(yii\\base\\InlineAction))\n#2 [internal function]: yii\\base\\ActionFilter->beforeFilter(Object(yii\\base\\ActionEvent))\n#3 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Component.php(627): call_user_func(Array, Object(yii\\base\\ActionEvent))\n#4 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(276): yii\\base\\Component->trigger(\'beforeAction\', Object(yii\\base\\ActionEvent))\n#5 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Controller.php(185): yii\\base\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#6 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/base/TBaseController.php(74): yii\\web\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#7 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/components/TController.php(231): app\\base\\TBaseController->beforeAction(Object(yii\\base\\InlineAction))\n#8 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(155): app\\components\\TController->beforeAction(Object(yii\\base\\InlineAction))\n#9 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'ajax\', Array)\n#10 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'appointment/aja...\', Array)\n#11 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(app\\components\\TRequest))\n#12 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/index.php(10): yii\\base\\Application->run()\n#13 {main}', 1, '403:  /signal-a-doc/appointment/ajax/175?type=app%5Cmodels%5CUser&function=doctorAppointment&addMenu=1', 0, '2020-03-25 11:55:29'),
(6, 'You are not allowed to perform this action.', '', '#0 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/filters/AccessControl.php(140): yii\\filters\\AccessControl->denyAccess(Object(app\\components\\WebUser))\n#1 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/ActionFilter.php(77): yii\\filters\\AccessControl->beforeAction(Object(yii\\base\\InlineAction))\n#2 [internal function]: yii\\base\\ActionFilter->beforeFilter(Object(yii\\base\\ActionEvent))\n#3 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Component.php(627): call_user_func(Array, Object(yii\\base\\ActionEvent))\n#4 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(276): yii\\base\\Component->trigger(\'beforeAction\', Object(yii\\base\\ActionEvent))\n#5 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Controller.php(185): yii\\base\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#6 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/base/TBaseController.php(74): yii\\web\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#7 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/components/TController.php(231): app\\base\\TBaseController->beforeAction(Object(yii\\base\\InlineAction))\n#8 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(155): app\\components\\TController->beforeAction(Object(yii\\base\\InlineAction))\n#9 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'ajax\', Array)\n#10 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'appointment/aja...\', Array)\n#11 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(app\\components\\TRequest))\n#12 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/index.php(10): yii\\base\\Application->run()\n#13 {main}', 1, '403:  /signal-a-doc/appointment/ajax/177?type=app%5Cmodels%5CUser&function=patientAppointment&addMenu=1', 0, '2020-03-25 11:56:01'),
(7, 'You are not allowed to perform this action.', '', '#0 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/filters/AccessControl.php(140): yii\\filters\\AccessControl->denyAccess(Object(app\\components\\WebUser))\n#1 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/ActionFilter.php(77): yii\\filters\\AccessControl->beforeAction(Object(yii\\base\\InlineAction))\n#2 [internal function]: yii\\base\\ActionFilter->beforeFilter(Object(yii\\base\\ActionEvent))\n#3 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Component.php(627): call_user_func(Array, Object(yii\\base\\ActionEvent))\n#4 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(276): yii\\base\\Component->trigger(\'beforeAction\', Object(yii\\base\\ActionEvent))\n#5 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Controller.php(185): yii\\base\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#6 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/base/TBaseController.php(74): yii\\web\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#7 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/components/TController.php(231): app\\base\\TBaseController->beforeAction(Object(yii\\base\\InlineAction))\n#8 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(155): app\\components\\TController->beforeAction(Object(yii\\base\\InlineAction))\n#9 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'ajax\', Array)\n#10 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'appointment/aja...\', Array)\n#11 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(app\\components\\TRequest))\n#12 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/index.php(10): yii\\base\\Application->run()\n#13 {main}', 1, '403:  /signal-a-doc/appointment/ajax/177?type=app%5Cmodels%5CUser&function=patientAppointment&addMenu=1', 0, '2020-03-25 11:57:06'),
(8, 'You are not allowed to perform this action.', '', '#0 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/filters/AccessControl.php(140): yii\\filters\\AccessControl->denyAccess(Object(app\\components\\WebUser))\n#1 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/ActionFilter.php(77): yii\\filters\\AccessControl->beforeAction(Object(yii\\base\\InlineAction))\n#2 [internal function]: yii\\base\\ActionFilter->beforeFilter(Object(yii\\base\\ActionEvent))\n#3 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Component.php(627): call_user_func(Array, Object(yii\\base\\ActionEvent))\n#4 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(276): yii\\base\\Component->trigger(\'beforeAction\', Object(yii\\base\\ActionEvent))\n#5 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Controller.php(185): yii\\base\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#6 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/base/TBaseController.php(74): yii\\web\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#7 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/components/TController.php(231): app\\base\\TBaseController->beforeAction(Object(yii\\base\\InlineAction))\n#8 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(155): app\\components\\TController->beforeAction(Object(yii\\base\\InlineAction))\n#9 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'ajax\', Array)\n#10 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'appointment/aja...\', Array)\n#11 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(app\\components\\TRequest))\n#12 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/index.php(10): yii\\base\\Application->run()\n#13 {main}', 1, '403:  /signal-a-doc/appointment/ajax/176?type=app%5Cmodels%5CUser&function=patientAppointment&addMenu=1', 0, '2020-03-25 19:41:44'),
(9, 'You are not allowed to perform this action.', '', '#0 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/filters/AccessControl.php(140): yii\\filters\\AccessControl->denyAccess(Object(app\\components\\WebUser))\n#1 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/ActionFilter.php(77): yii\\filters\\AccessControl->beforeAction(Object(yii\\base\\InlineAction))\n#2 [internal function]: yii\\base\\ActionFilter->beforeFilter(Object(yii\\base\\ActionEvent))\n#3 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Component.php(627): call_user_func(Array, Object(yii\\base\\ActionEvent))\n#4 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(276): yii\\base\\Component->trigger(\'beforeAction\', Object(yii\\base\\ActionEvent))\n#5 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Controller.php(185): yii\\base\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#6 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/base/TBaseController.php(74): yii\\web\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#7 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/components/TController.php(231): app\\base\\TBaseController->beforeAction(Object(yii\\base\\InlineAction))\n#8 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(155): app\\components\\TController->beforeAction(Object(yii\\base\\InlineAction))\n#9 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'ajax\', Array)\n#10 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'appointment/aja...\', Array)\n#11 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(app\\components\\TRequest))\n#12 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/index.php(10): yii\\base\\Application->run()\n#13 {main}', 1, '403:  /signal-a-doc/appointment/ajax/153?type=app%5Cmodels%5CUser&function=patientAppointment&addMenu=1', 0, '2020-03-25 19:41:54'),
(10, 'You are not allowed to perform this action.', '', '#0 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/filters/AccessControl.php(140): yii\\filters\\AccessControl->denyAccess(Object(app\\components\\WebUser))\n#1 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/ActionFilter.php(77): yii\\filters\\AccessControl->beforeAction(Object(yii\\base\\InlineAction))\n#2 [internal function]: yii\\base\\ActionFilter->beforeFilter(Object(yii\\base\\ActionEvent))\n#3 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Component.php(627): call_user_func(Array, Object(yii\\base\\ActionEvent))\n#4 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(276): yii\\base\\Component->trigger(\'beforeAction\', Object(yii\\base\\ActionEvent))\n#5 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Controller.php(185): yii\\base\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#6 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/base/TBaseController.php(74): yii\\web\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#7 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/components/TController.php(231): app\\base\\TBaseController->beforeAction(Object(yii\\base\\InlineAction))\n#8 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(155): app\\components\\TController->beforeAction(Object(yii\\base\\InlineAction))\n#9 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'ajax\', Array)\n#10 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'appointment/aja...\', Array)\n#11 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(app\\components\\TRequest))\n#12 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/index.php(10): yii\\base\\Application->run()\n#13 {main}', 1, '403:  /signal-a-doc/appointment/ajax/175?type=app%5Cmodels%5CUser&function=doctorAppointment&addMenu=1', 0, '2020-03-25 19:43:26'),
(11, 'Method Not Allowed. This URL can only handle the following request methods: POST.', '', '#0 [internal function]: yii\\filters\\VerbFilter->beforeAction(Object(yii\\base\\ActionEvent))\n#1 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Component.php(627): call_user_func(Array, Object(yii\\base\\ActionEvent))\n#2 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(276): yii\\base\\Component->trigger(\'beforeAction\', Object(yii\\base\\ActionEvent))\n#3 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Controller.php(185): yii\\base\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#4 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/base/TBaseController.php(74): yii\\web\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#5 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/components/TController.php(231): app\\base\\TBaseController->beforeAction(Object(yii\\base\\InlineAction))\n#6 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(155): app\\components\\TController->beforeAction(Object(yii\\base\\InlineAction))\n#7 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'delete\', Array)\n#8 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'category/delete\', Array)\n#9 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(app\\components\\TRequest))\n#10 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/index.php(10): yii\\base\\Application->run()\n#11 {main}', 1, '405:  /signal-a-doc/category/delete/10/emergency-medicine-specialists', 0, '2020-03-26 11:14:48'),
(12, 'Method Not Allowed. This URL can only handle the following request methods: POST.', '', '#0 [internal function]: yii\\filters\\VerbFilter->beforeAction(Object(yii\\base\\ActionEvent))\n#1 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Component.php(627): call_user_func(Array, Object(yii\\base\\ActionEvent))\n#2 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(276): yii\\base\\Component->trigger(\'beforeAction\', Object(yii\\base\\ActionEvent))\n#3 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Controller.php(185): yii\\base\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#4 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/base/TBaseController.php(74): yii\\web\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#5 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/components/TController.php(231): app\\base\\TBaseController->beforeAction(Object(yii\\base\\InlineAction))\n#6 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(155): app\\components\\TController->beforeAction(Object(yii\\base\\InlineAction))\n#7 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'delete\', Array)\n#8 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'user/delete\', Array)\n#9 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(app\\components\\TRequest))\n#10 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/index.php(10): yii\\base\\Application->run()\n#11 {main}', 1, '405:  /signal-a-doc/user/delete/184/riya-mahajan', 0, '2020-03-26 13:22:47'),
(13, 'Method Not Allowed. This URL can only handle the following request methods: POST.', '', '#0 [internal function]: yii\\filters\\VerbFilter->beforeAction(Object(yii\\base\\ActionEvent))\n#1 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Component.php(627): call_user_func(Array, Object(yii\\base\\ActionEvent))\n#2 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(276): yii\\base\\Component->trigger(\'beforeAction\', Object(yii\\base\\ActionEvent))\n#3 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Controller.php(185): yii\\base\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#4 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/base/TBaseController.php(74): yii\\web\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#5 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/components/TController.php(231): app\\base\\TBaseController->beforeAction(Object(yii\\base\\InlineAction))\n#6 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(155): app\\components\\TController->beforeAction(Object(yii\\base\\InlineAction))\n#7 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'delete\', Array)\n#8 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'user/delete\', Array)\n#9 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(app\\components\\TRequest))\n#10 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/index.php(10): yii\\base\\Application->run()\n#11 {main}', 1, '405:  /signal-a-doc/user/delete/184/riya-mahajan', 0, '2020-03-26 13:22:51'),
(14, 'You are not allowed to perform this action.', '', '#0 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/filters/AccessControl.php(140): yii\\filters\\AccessControl->denyAccess(Object(app\\components\\WebUser))\n#1 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/ActionFilter.php(77): yii\\filters\\AccessControl->beforeAction(Object(yii\\base\\InlineAction))\n#2 [internal function]: yii\\base\\ActionFilter->beforeFilter(Object(yii\\base\\ActionEvent))\n#3 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Component.php(627): call_user_func(Array, Object(yii\\base\\ActionEvent))\n#4 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(276): yii\\base\\Component->trigger(\'beforeAction\', Object(yii\\base\\ActionEvent))\n#5 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Controller.php(188): yii\\base\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#6 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/base/TBaseController.php(74): yii\\web\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#7 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/components/TController.php(231): app\\base\\TBaseController->beforeAction(Object(yii\\base\\InlineAction))\n#8 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(155): app\\components\\TController->beforeAction(Object(yii\\base\\InlineAction))\n#9 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'ajax\', Array)\n#10 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'appointment/aja...\', Array)\n#11 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(app\\components\\TRequest))\n#12 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/index.php(10): yii\\base\\Application->run()\n#13 {main}', 1, '403:  /signal-a-doc/appointment/ajax/195?type=app%5Cmodels%5CUser&function=doctorAppointment&addMenu=1', 0, '2020-03-31 13:16:42'),
(15, 'You are not allowed to perform this action.', '', '#0 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/filters/AccessControl.php(140): yii\\filters\\AccessControl->denyAccess(Object(app\\components\\WebUser))\n#1 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/ActionFilter.php(77): yii\\filters\\AccessControl->beforeAction(Object(yii\\base\\InlineAction))\n#2 [internal function]: yii\\base\\ActionFilter->beforeFilter(Object(yii\\base\\ActionEvent))\n#3 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Component.php(627): call_user_func(Array, Object(yii\\base\\ActionEvent))\n#4 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(276): yii\\base\\Component->trigger(\'beforeAction\', Object(yii\\base\\ActionEvent))\n#5 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Controller.php(188): yii\\base\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#6 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/base/TBaseController.php(74): yii\\web\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#7 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/components/TController.php(231): app\\base\\TBaseController->beforeAction(Object(yii\\base\\InlineAction))\n#8 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(155): app\\components\\TController->beforeAction(Object(yii\\base\\InlineAction))\n#9 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'ajax\', Array)\n#10 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'appointment/aja...\', Array)\n#11 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(app\\components\\TRequest))\n#12 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/index.php(10): yii\\base\\Application->run()\n#13 {main}', 1, '403:  /signal-a-doc/appointment/ajax/195?type=app%5Cmodels%5CUser&function=doctorAppointment&addMenu=1', 0, '2020-03-31 13:16:50'),
(16, 'You are not allowed to perform this action.', '', '#0 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/filters/AccessControl.php(140): yii\\filters\\AccessControl->denyAccess(Object(app\\components\\WebUser))\n#1 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/ActionFilter.php(77): yii\\filters\\AccessControl->beforeAction(Object(yii\\base\\InlineAction))\n#2 [internal function]: yii\\base\\ActionFilter->beforeFilter(Object(yii\\base\\ActionEvent))\n#3 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Component.php(627): call_user_func(Array, Object(yii\\base\\ActionEvent))\n#4 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(276): yii\\base\\Component->trigger(\'beforeAction\', Object(yii\\base\\ActionEvent))\n#5 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Controller.php(188): yii\\base\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#6 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/base/TBaseController.php(74): yii\\web\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#7 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/components/TController.php(231): app\\base\\TBaseController->beforeAction(Object(yii\\base\\InlineAction))\n#8 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(155): app\\components\\TController->beforeAction(Object(yii\\base\\InlineAction))\n#9 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'login\', Array)\n#10 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'\', Array)\n#11 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(app\\components\\TRequest))\n#12 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/index.php(10): yii\\base\\Application->run()\n#13 {main}', 1, '403:  /signal-a-doc/', 0, '2020-04-02 16:35:58'),
(17, 'You are not allowed to perform this action.', '', '#0 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/filters/AccessControl.php(140): yii\\filters\\AccessControl->denyAccess(Object(app\\components\\WebUser))\n#1 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/ActionFilter.php(77): yii\\filters\\AccessControl->beforeAction(Object(yii\\base\\InlineAction))\n#2 [internal function]: yii\\base\\ActionFilter->beforeFilter(Object(yii\\base\\ActionEvent))\n#3 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Component.php(627): call_user_func(Array, Object(yii\\base\\ActionEvent))\n#4 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(276): yii\\base\\Component->trigger(\'beforeAction\', Object(yii\\base\\ActionEvent))\n#5 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Controller.php(188): yii\\base\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#6 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/base/TBaseController.php(74): yii\\web\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#7 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/protected/components/TController.php(231): app\\base\\TBaseController->beforeAction(Object(yii\\base\\InlineAction))\n#8 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Controller.php(155): app\\components\\TController->beforeAction(Object(yii\\base\\InlineAction))\n#9 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'login\', Array)\n#10 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'\', Array)\n#11 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(app\\components\\TRequest))\n#12 /var/sentora/hostdata/toxsl/public_html/beta_toxsl_in/signal-a-doc/index.php(10): yii\\base\\Application->run()\n#13 {main}', 1, '403:  /signal-a-doc/', 0, '2020-04-02 16:50:28');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login_history`
--

CREATE TABLE `tbl_login_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `failer_reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_login_history`
--

INSERT INTO `tbl_login_history` (`id`, `user_id`, `user_ip`, `user_agent`, `failer_reason`, `state_id`, `type_id`, `code`, `created_on`) VALUES
(1, 109, '192.168.10.1', 'okhttp/3.12.0', '{\"username\":[\"You are not allowed to perform this action.\"]}', 0, 0, '', '2020-03-13 14:49:30'),
(2, 109, '192.168.10.1', 'okhttp/3.12.0', '{\"username\":[\"You are not allowed to perform this action.\"]}', 0, 0, '', '2020-03-13 14:49:57'),
(3, 109, '192.168.10.1', 'okhttp/3.12.0', '{\"username\":[\"You are not allowed to perform this action.\"]}', 0, 0, '', '2020-03-13 14:50:11'),
(4, 1, '192.168.10.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:74.0) Gecko/20100101 Firefox/74.0', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-13 14:51:31'),
(5, 109, '192.168.10.1', 'PostmanRuntime/7.23.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-13 14:59:50'),
(6, 109, '192.168.10.1', 'PostmanRuntime/7.23.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-13 14:59:57'),
(7, 109, '192.168.10.1', 'PostmanRuntime/7.23.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-13 15:00:57'),
(8, 1, '192.168.10.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-13 15:03:52'),
(9, 109, '192.168.10.1', 'PostmanRuntime/7.23.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-13 15:05:11'),
(10, 1, '192.168.10.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-13 15:05:58'),
(11, 115, '192.168.10.1', 'PostmanRuntime/7.23.0', '', 1, 0, '', '2020-03-13 15:06:59'),
(12, 109, '192.168.10.1', 'PostmanRuntime/7.23.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-13 15:07:54'),
(13, 115, '192.168.10.1', 'PostmanRuntime/7.23.0', '', 1, 0, '', '2020-03-13 15:08:20'),
(14, 115, '192.168.10.1', 'PostmanRuntime/7.23.0', '', 1, 0, '', '2020-03-13 15:08:49'),
(15, 109, '192.168.10.1', 'PostmanRuntime/7.23.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-13 15:09:00'),
(16, 109, '192.168.10.1', 'PostmanRuntime/7.23.0', '', 1, 0, '', '2020-03-13 15:09:43'),
(17, 1, '192.168.10.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:74.0) Gecko/20100101 Firefox/74.0', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-13 15:10:14'),
(18, 109, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-13 15:10:15'),
(19, 108, '192.168.10.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:74.0) Gecko/20100101 Firefox/74.0', '{\"username\":[\"You are not allowed to perform this action.\"]}', 0, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-13 15:11:35'),
(20, 1, '192.168.10.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:74.0) Gecko/20100101 Firefox/74.0', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-13 15:14:31'),
(21, 1, '192.168.10.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-13 17:03:29'),
(22, 1, '192.168.10.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-13 18:32:18'),
(23, 1, '192.168.10.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:74.0) Gecko/20100101 Firefox/74.0', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-13 18:33:22'),
(24, 1, '192.168.10.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-13 18:41:04'),
(25, 1, '192.168.10.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-13 19:47:54'),
(26, 1, '129.56.52.248', 'Mozilla/5.0 (Linux; Android 9; MRD-LX1F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Mobile Safari/537.36', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-13 20:06:36'),
(27, 1, '192.168.10.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:74.0) Gecko/20100101 Firefox/74.0', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-14 09:42:59'),
(28, 117, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-14 09:44:43'),
(29, 117, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-14 12:13:48'),
(30, 117, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-14 14:38:02'),
(31, 117, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-14 15:08:21'),
(32, 122, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-14 15:23:51'),
(33, 117, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-14 17:24:14'),
(34, 111, '41.217.73.152', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-15 11:59:40'),
(35, 111, '41.217.73.152', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-15 11:59:59'),
(36, 111, '41.217.73.152', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-15 12:00:12'),
(37, 123, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-16 10:16:57'),
(38, 123, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-16 10:23:06'),
(39, 117, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-16 10:23:18'),
(40, 117, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-16 10:23:32'),
(41, 117, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-16 10:23:43'),
(42, 122, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-16 10:24:25'),
(43, 122, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-16 10:24:31'),
(44, 117, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-16 11:20:23'),
(45, 117, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-16 11:36:26'),
(46, 1, '192.168.10.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-16 12:22:14'),
(47, 117, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-16 18:31:16'),
(48, 1, '192.168.10.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:74.0) Gecko/20100101 Firefox/74.0', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-17 09:18:47'),
(49, 124, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 09:19:08'),
(50, 125, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 09:53:05'),
(51, 125, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 09:53:13'),
(52, 126, '192.168.10.1', 'PostmanRuntime/7.23.0', '', 1, 0, '', '2020-03-17 10:03:09'),
(53, 125, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 10:38:32'),
(54, 125, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 10:38:39'),
(55, 125, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 10:38:53'),
(56, 122, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 10:39:09'),
(57, 122, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 10:39:15'),
(58, 125, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 10:40:23'),
(59, 125, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 10:40:38'),
(60, 127, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 10:42:32'),
(61, 124, '192.168.10.1', 'PostmanRuntime/7.23.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 11:28:18'),
(62, 124, '192.168.10.1', 'PostmanRuntime/7.23.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 11:28:31'),
(63, 1, '192.168.10.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:74.0) Gecko/20100101 Firefox/74.0', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-17 11:37:54'),
(64, 124, '192.168.10.1', 'PostmanRuntime/7.23.0', '', 1, 0, '', '2020-03-17 11:38:41'),
(65, 124, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 11:38:58'),
(66, 124, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 11:39:25'),
(67, 124, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 11:39:35'),
(68, 124, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 11:39:56'),
(69, 124, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 11:45:31'),
(70, 124, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 11:45:45'),
(71, 124, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 11:46:21'),
(72, 1, '192.168.10.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:74.0) Gecko/20100101 Firefox/74.0', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-17 11:49:17'),
(73, 124, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 11:52:58'),
(74, 124, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 11:53:08'),
(75, 124, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 11:55:26'),
(76, 124, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 11:55:34'),
(77, 125, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 11:56:09'),
(78, 125, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 11:56:26'),
(79, 125, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 11:56:30'),
(80, 125, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 11:56:42'),
(81, 124, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 12:01:58'),
(82, 124, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 12:02:20'),
(83, 125, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 12:05:18'),
(84, 125, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 12:05:28'),
(85, 125, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 12:05:35'),
(86, 124, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 12:21:39'),
(87, 124, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 12:21:49'),
(88, 124, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 12:30:18'),
(89, 125, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 12:31:25'),
(90, 124, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 12:34:10'),
(91, 124, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 12:34:22'),
(92, 124, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 12:35:33'),
(93, 1, '192.168.10.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-17 13:23:12'),
(94, 130, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 13:26:58'),
(95, 130, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 13:27:09'),
(96, 131, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 15:25:31'),
(97, 131, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 15:27:43'),
(98, 132, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 15:34:27'),
(99, 132, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 15:34:43'),
(100, 133, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 15:38:14'),
(101, 133, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 15:48:36'),
(102, 131, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 15:50:02'),
(103, 132, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 16:26:08'),
(104, 132, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 16:26:17'),
(105, 125, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 16:58:42'),
(106, 125, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 16:58:54'),
(107, 133, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 16:59:15'),
(108, 132, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 17:00:46'),
(109, 131, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 17:01:11'),
(110, 125, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 17:03:32'),
(111, 133, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 17:03:44'),
(112, 132, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 17:07:44'),
(113, 132, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 17:07:53'),
(114, 132, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 17:08:07'),
(115, 132, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 17:44:01'),
(116, 136, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 17:48:02'),
(117, 132, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 17:51:16'),
(118, 132, '192.168.10.1', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-17 17:51:28'),
(119, 132, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 17:51:38'),
(120, 138, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 18:01:59'),
(121, 139, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 18:15:23'),
(122, 133, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 18:26:19'),
(123, 131, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 18:38:33'),
(124, 141, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 18:40:56'),
(125, 140, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 19:00:18'),
(126, 142, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 19:01:22'),
(127, 143, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 19:03:40'),
(128, 144, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 19:10:50'),
(129, 145, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 19:16:38'),
(130, 143, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 19:19:26'),
(131, 146, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 19:37:36'),
(132, 147, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 19:41:05'),
(133, 148, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 19:49:04'),
(134, 149, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 20:04:00'),
(135, 150, '105.112.24.137', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 20:42:53'),
(136, 151, '94.10.66.53', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 22:04:59'),
(137, 152, '94.10.66.53', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 22:23:49'),
(138, 153, '129.56.53.232', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-17 23:44:06'),
(139, 152, '129.56.49.135', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-18 03:51:57'),
(140, 152, '129.56.49.135', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-18 03:52:22'),
(141, 152, '129.56.49.135', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-18 03:52:38'),
(142, 1, '129.56.49.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-18 04:13:25'),
(143, 152, '129.56.49.135', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-18 04:16:15'),
(144, 152, '129.56.49.135', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-18 04:18:49'),
(145, 1, '192.168.10.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-18 09:25:06'),
(146, 1, '192.168.10.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:74.0) Gecko/20100101 Firefox/74.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-18 12:42:08'),
(147, 1, '192.168.10.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:74.0) Gecko/20100101 Firefox/74.0', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-18 12:42:20'),
(148, 149, '192.168.10.1', 'PostmanRuntime/7.23.0', '', 1, 0, '', '2020-03-18 12:44:10'),
(149, 149, '192.168.10.1', 'PostmanRuntime/7.23.0', '', 1, 0, '', '2020-03-18 12:45:31'),
(150, 154, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-18 12:52:10'),
(151, 155, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-18 12:52:31'),
(152, 1, '192.168.10.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:74.0) Gecko/20100101 Firefox/74.0', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-18 13:03:31'),
(153, 162, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-18 13:40:55'),
(154, 163, '94.10.66.53', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-18 17:41:02'),
(155, 164, '129.56.99.3', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-18 17:46:29'),
(156, 154, '192.168.10.1', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-18 18:08:49'),
(157, 150, '105.112.38.59', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-18 21:45:31'),
(158, 1, '192.168.10.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-19 10:23:18'),
(159, 1, '42.109.246.36', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-24 09:54:10'),
(160, 1, '42.109.246.36', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-24 09:54:17'),
(161, 169, '42.109.246.90', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-24 10:41:09'),
(162, 170, '42.109.246.90', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-24 10:51:52'),
(163, 171, '42.109.246.90', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-24 11:06:32'),
(164, 171, '42.109.232.52', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-24 12:00:21'),
(165, 171, '42.109.232.52', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-24 12:57:30'),
(166, 1, '122.173.116.172', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-24 14:24:14'),
(167, 1, '122.173.116.172', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-24 14:24:25'),
(168, 173, '42.109.246.90', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-24 15:29:11'),
(169, 174, '42.109.246.90', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-24 15:34:38'),
(170, 175, '129.56.53.91', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-24 17:39:01'),
(171, 176, '105.112.50.173', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-24 23:49:09'),
(172, 1, '42.109.239.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-25 09:29:01'),
(173, 177, '42.109.250.16', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-25 09:33:21'),
(174, 1, '122.173.116.172', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-25 10:10:49'),
(175, 177, '42.109.250.49', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-25 11:19:23'),
(176, 1, '103.54.101.176', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-25 11:43:34'),
(177, 177, '106.204.110.93', 'okhttp/4.2.0', '', 1, 0, '', '2020-03-25 15:07:24'),
(178, 177, '106.204.110.93', 'okhttp/4.2.0', '', 1, 0, '', '2020-03-25 15:07:44'),
(179, 177, '106.204.110.93', 'okhttp/4.2.0', '', 1, 0, '', '2020-03-25 15:08:20'),
(180, 177, '106.204.110.93', 'okhttp/4.2.0', '', 1, 0, '', '2020-03-25 15:14:00'),
(181, 177, '106.204.110.93', 'okhttp/4.2.0', '', 1, 0, '', '2020-03-25 15:17:46'),
(182, 177, '106.204.110.93', 'okhttp/4.2.0', '', 1, 0, '', '2020-03-25 15:18:49'),
(183, 177, '106.204.110.93', 'okhttp/4.2.0', '', 1, 0, '', '2020-03-25 15:19:26'),
(184, 177, '106.204.110.93', 'okhttp/4.2.0', '', 1, 0, '', '2020-03-25 15:21:43'),
(185, 178, '42.109.239.148', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-25 15:34:31'),
(186, 179, '106.204.110.93', 'okhttp/4.2.0', '', 1, 0, '', '2020-03-25 15:47:55'),
(187, 1, '157.39.70.248', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:74.0) Gecko/20100101 Firefox/74.0', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-25 15:58:34'),
(188, 180, '103.54.101.176', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-25 16:42:01'),
(189, 180, '103.54.101.176', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-25 16:42:12'),
(190, 181, '103.54.101.176', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-25 16:55:16'),
(191, 182, '171.48.96.99', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-25 19:02:39'),
(192, 1, '129.56.65.169', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-25 19:36:03'),
(193, 1, '129.56.65.169', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-25 19:36:27'),
(194, 183, '94.10.66.53', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-25 20:06:03'),
(195, 184, '42.109.244.81', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-26 10:35:38'),
(196, 1, '122.173.116.172', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-26 11:14:08'),
(197, 179, '106.204.237.172', 'okhttp/4.2.0', '', 1, 0, '', '2020-03-26 12:26:17'),
(198, 185, '42.109.244.81', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-26 13:24:24'),
(199, 186, '106.78.83.23', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-26 15:19:40'),
(200, 186, '106.78.83.23', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-26 15:19:51'),
(201, 187, '106.78.83.23', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-26 15:26:25'),
(202, 179, '106.204.237.172', 'okhttp/4.2.0', '', 1, 0, '', '2020-03-26 15:28:00'),
(203, 189, '94.10.66.53', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-26 21:40:06'),
(204, 190, '94.10.66.53', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-26 21:51:33'),
(205, 153, '129.56.67.175', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-27 11:08:10'),
(206, 153, '129.56.67.175', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-27 11:08:25'),
(207, 153, '129.56.67.175', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-27 11:08:39'),
(208, 184, '106.204.237.172', 'okhttp/4.2.0', '', 1, 0, '', '2020-03-27 11:38:14'),
(209, 184, '106.204.237.172', 'okhttp/4.2.0', '', 1, 0, '', '2020-03-27 11:49:48'),
(210, 1, '106.204.196.178', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-27 12:43:01'),
(211, 173, '106.204.237.172', 'okhttp/4.2.0', '', 1, 0, '', '2020-03-27 14:59:42'),
(212, 184, '42.109.232.59', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-30 09:58:47'),
(213, 1, '49.14.104.184', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-30 10:59:11'),
(214, 1, '49.14.104.184', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-30 10:59:20'),
(215, 173, '106.204.227.98', 'okhttp/4.2.0', '', 1, 0, '', '2020-03-30 13:40:14'),
(216, 195, '106.204.227.98', 'okhttp/4.2.0', '', 1, 0, '', '2020-03-30 14:48:20'),
(217, 173, '106.204.227.98', 'okhttp/4.2.0', '', 1, 0, '', '2020-03-30 14:48:38'),
(218, 173, '106.204.227.98', 'okhttp/4.2.0', '', 1, 0, '', '2020-03-30 14:49:26'),
(219, 184, '106.204.227.98', 'okhttp/4.2.0', '', 1, 0, '', '2020-03-31 10:02:29'),
(220, 195, '106.204.227.98', 'okhttp/4.2.0', '', 1, 0, '', '2020-03-31 10:54:38'),
(221, 184, '42.109.238.52', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-31 11:01:06'),
(222, 184, '106.204.227.98', 'okhttp/4.2.0', '', 1, 0, '', '2020-03-31 12:00:56'),
(223, 184, '42.109.238.52', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-31 12:11:52'),
(224, 179, '106.204.227.98', 'okhttp/4.2.0', '', 1, 0, '', '2020-03-31 12:40:49'),
(225, 1, '122.173.155.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-03-31 13:16:29'),
(226, 196, '106.204.227.98', 'okhttp/4.2.0', '', 1, 0, '', '2020-03-31 16:56:52'),
(227, 197, '94.10.66.53', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-31 20:26:00'),
(228, 197, '94.10.66.53', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-31 20:26:22'),
(229, 197, '94.10.66.53', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-31 20:32:16'),
(230, 197, '94.10.66.53', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-31 20:32:44'),
(231, 197, '94.10.66.53', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-31 20:32:47'),
(232, 197, '94.10.66.53', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-31 20:32:50'),
(233, 197, '94.10.66.53', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-31 20:34:17'),
(234, 197, '94.10.66.53', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-31 20:34:21'),
(235, 197, '94.10.66.53', 'okhttp/3.12.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, '', '2020-03-31 20:34:44'),
(236, 198, '94.10.66.53', 'okhttp/3.12.0', '', 1, 0, '', '2020-03-31 20:38:20'),
(237, 195, '106.204.228.252', 'okhttp/4.2.0', '', 1, 0, '', '2020-04-01 10:52:40'),
(238, 173, '106.204.228.252', 'okhttp/4.2.0', '', 1, 0, '', '2020-04-01 16:47:32'),
(239, 195, '106.204.228.252', 'okhttp/4.2.0', '', 1, 0, '', '2020-04-01 16:48:56'),
(240, 184, '42.109.228.25', 'okhttp/3.12.0', '', 1, 0, '', '2020-04-02 10:21:41'),
(241, 1, '223.225.128.67', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0', '{\"password\":[\"Incorrect Email or password.\"]}', 0, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-04-02 11:59:02'),
(242, 1, '223.225.128.67', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-04-02 11:59:15'),
(243, 1, '122.173.128.44', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/', '2020-04-02 16:11:41'),
(244, 199, '223.225.128.67', 'okhttp/4.2.0', '', 1, 0, '', '2020-04-02 16:51:17'),
(245, 179, '223.225.128.67', 'okhttp/4.2.0', '', 1, 0, '', '2020-04-02 16:51:48'),
(246, 199, '223.225.128.67', 'okhttp/4.2.0', '', 1, 0, '', '2020-04-02 16:52:33'),
(247, 195, '223.225.128.67', 'okhttp/4.2.0', '', 1, 0, '', '2020-04-02 16:52:41'),
(248, 199, '223.225.128.67', 'okhttp/4.2.0', '', 1, 0, '', '2020-04-02 16:52:56'),
(249, 1, '122.173.128.44', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-04-02 16:56:24'),
(250, 1, '122.173.128.44', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '', 1, 0, 'http://beta.toxsl.in/signal-a-doc/user/login', '2020-04-02 17:44:02'),
(251, 200, '223.225.128.67', 'okhttp/4.2.0', '', 1, 0, '', '2020-04-02 17:47:52'),
(252, 201, '223.225.128.67', 'okhttp/4.2.0', '', 1, 0, '', '2020-04-02 17:51:27'),
(253, 201, '223.225.128.67', 'okhttp/4.2.0', '', 1, 0, '', '2020-04-02 17:53:28'),
(254, 202, '223.225.128.67', 'okhttp/4.2.0', '', 1, 0, '', '2020-04-02 17:53:45'),
(255, 201, '223.225.128.67', 'okhttp/4.2.0', '', 1, 0, '', '2020-04-02 17:58:32'),
(256, 202, '223.225.128.67', 'okhttp/4.2.0', '', 1, 0, '', '2020-04-02 18:00:02'),
(257, 201, '223.225.128.67', 'okhttp/4.2.0', '', 1, 0, '', '2020-04-02 18:06:00'),
(258, 184, '117.222.201.29', 'okhttp/4.2.0', '', 1, 0, '', '2020-04-02 18:58:48');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_message`
--

CREATE TABLE `tbl_message` (
  `id` int(11) NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `session_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `state_id` int(11) NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL DEFAULT '0',
  `to_id` int(11) NOT NULL DEFAULT '0',
  `send_time` datetime DEFAULT NULL,
  `image_file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_id` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `appointment_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_migration`
--

CREATE TABLE `tbl_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_migration`
--

INSERT INTO `tbl_migration` (`version`, `apply_time`) VALUES
('m200330_140334_createTable_patient_health_profile', 1585686005),
('m200330_141823_createTable_patient_medicine_history', 1585686005),
('m200330_142537_createTable_patient_allergies', 1585686005),
('m200331_180728_createTable_patient_illness', 1585686006),
('m200331_205647_createTable_tbl_category_question_repeate_type', 1585690807);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notice`
--

CREATE TABLE `tbl_notice` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `model_type` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` int(11) NOT NULL,
  `state_id` int(11) DEFAULT '0',
  `type_id` int(11) DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notification`
--

CREATE TABLE `tbl_notification` (
  `id` int(11) NOT NULL,
  `title` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `model_id` int(11) NOT NULL,
  `model_type` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `is_read` tinyint(2) DEFAULT '0',
  `state_id` int(11) DEFAULT '0',
  `type_id` int(11) DEFAULT '0',
  `created_on` datetime NOT NULL,
  `to_user_id` int(11) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_notification`
--

INSERT INTO `tbl_notification` (`id`, `title`, `description`, `model_id`, `model_type`, `is_read`, `state_id`, `type_id`, `created_on`, `to_user_id`, `created_by_id`) VALUES
(2, 'Pass Singh has sent an appointment request to Pass Singh', NULL, 1, 'app\\models\\Appointment', 0, 0, 0, '2020-04-01 14:56:42', 1, 179),
(4, 'Pass Singh has sent an appointment request to Pass Singh', NULL, 2, 'app\\models\\Appointment', 0, 0, 0, '2020-04-01 14:57:08', 1, 179),
(6, 'Pass Singh has sent an appointment request to Pass Singh', NULL, 3, 'app\\models\\Appointment', 0, 0, 0, '2020-04-01 14:57:32', 1, 179),
(8, 'Pass Singh has sent an appointment request to Pass Singh', NULL, 4, 'app\\models\\Appointment', 0, 0, 0, '2020-04-01 14:57:36', 1, 179),
(10, 'Pass Singh has sent an appointment request to Pass Singh', NULL, 5, 'app\\models\\Appointment', 0, 0, 0, '2020-04-01 15:28:08', 1, 179),
(12, 'Pass Singh has sent an appointment request to Pass Singh', NULL, 6, 'app\\models\\Appointment', 0, 0, 0, '2020-04-01 15:42:57', 1, 179),
(14, 'Pass Singh has sent an appointment request to Pass Singh', NULL, 7, 'app\\models\\Appointment', 0, 0, 0, '2020-04-01 15:43:34', 1, 179),
(16, 'Riya Mahajan has sent an appointment request to Pass Singh', NULL, 8, 'app\\models\\Appointment', 0, 0, 0, '2020-04-02 10:36:40', 1, 184),
(18, 'Pass Singh has sent an appointment request to Pass Singh', NULL, 9, 'app\\models\\Appointment', 0, 0, 0, '2020-04-02 16:25:08', 1, 179),
(20, 'Pass Singh has sent an appointment request to Pass Singh', NULL, 10, 'app\\models\\Appointment', 0, 0, 0, '2020-04-02 16:28:41', 1, 179),
(21, 'Pass Singh has sent you appointment request', NULL, 11, 'app\\models\\Appointment', 0, 0, 0, '2020-04-02 17:56:12', 200, 179),
(22, 'Pass Singh has sent an appointment request to James James', NULL, 11, 'app\\models\\Appointment', 0, 0, 0, '2020-04-02 17:56:12', 1, 179),
(23, 'Pass Singh has sent you appointment request', NULL, 12, 'app\\models\\Appointment', 0, 0, 0, '2020-04-02 18:00:26', 201, 179),
(24, 'Pass Singh has sent an appointment request to Riya Mahajan', NULL, 12, 'app\\models\\Appointment', 0, 0, 0, '2020-04-02 18:00:26', 1, 179),
(25, 'Pass Singh has sent you appointment request', NULL, 13, 'app\\models\\Appointment', 0, 0, 0, '2020-04-02 18:00:39', 201, 179),
(26, 'Pass Singh has sent an appointment request to Riya Mahajan', NULL, 13, 'app\\models\\Appointment', 0, 0, 0, '2020-04-02 18:00:39', 1, 179),
(27, 'Pass Singh has sent you appointment request', NULL, 14, 'app\\models\\Appointment', 0, 0, 0, '2020-04-02 18:04:31', 200, 179),
(28, 'Pass Singh has sent an appointment request to James James', NULL, 14, 'app\\models\\Appointment', 0, 0, 0, '2020-04-02 18:04:31', 1, 179),
(29, 'Pass Singh has sent you appointment request', NULL, 15, 'app\\models\\Appointment', 0, 0, 0, '2020-04-02 18:17:33', 200, 179),
(30, 'Pass Singh has sent an appointment request to James James', NULL, 15, 'app\\models\\Appointment', 0, 0, 0, '2020-04-02 18:17:33', 1, 179);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_otp`
--

CREATE TABLE `tbl_otp` (
  `id` int(11) NOT NULL,
  `contact_no` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `otp_generated` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `state_id` int(11) DEFAULT '1',
  `type_id` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_page`
--

CREATE TABLE `tbl_page` (
  `id` int(11) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `state_id` int(11) DEFAULT '1',
  `type_id` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_patient_allergies`
--

CREATE TABLE `tbl_patient_allergies` (
  `id` int(11) NOT NULL,
  `health_profile` int(11) NOT NULL,
  `allergy` varchar(256) NOT NULL,
  `state_id` int(11) NOT NULL DEFAULT '0',
  `type_id` tinyint(1) DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_patient_answer`
--

CREATE TABLE `tbl_patient_answer` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `text` varchar(256) DEFAULT NULL,
  `state_id` int(11) NOT NULL DEFAULT '0',
  `type_id` tinyint(1) DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_patient_health_profile`
--

CREATE TABLE `tbl_patient_health_profile` (
  `id` int(11) NOT NULL,
  `step_count` int(11) NOT NULL,
  `currently_medicine` tinyint(1) DEFAULT '0',
  `state_id` int(11) NOT NULL DEFAULT '0',
  `type_id` tinyint(1) DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_patient_illness`
--

CREATE TABLE `tbl_patient_illness` (
  `id` int(11) NOT NULL,
  `health_profile` int(11) NOT NULL,
  `symptom_id` int(11) NOT NULL,
  `illness_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL DEFAULT '0',
  `type_id` tinyint(1) DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_patient_medical_information`
--

CREATE TABLE `tbl_patient_medical_information` (
  `id` int(11) NOT NULL,
  `blood_group` int(11) NOT NULL,
  `weight` double NOT NULL DEFAULT '0',
  `height` double NOT NULL DEFAULT '0',
  `allergies` varchar(255) DEFAULT NULL,
  `state_id` int(11) NOT NULL DEFAULT '0',
  `type_id` tinyint(1) DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_patient_medical_information`
--

INSERT INTO `tbl_patient_medical_information` (`id`, `blood_group`, `weight`, `height`, `allergies`, `state_id`, `type_id`, `created_on`, `updated_on`, `created_by_id`) VALUES
(3, 1, 0, 0, NULL, 0, 0, '2020-03-06 13:22:24', '2020-03-06 13:22:24', 2),
(128, 0, 55, 5, NULL, 0, 0, '2020-03-17 19:48:34', '2020-03-17 19:48:34', 148),
(129, 3, 150, 173, NULL, 0, 0, '2020-03-17 22:03:56', '2020-03-17 22:03:56', 151),
(130, 5, 85, 167, NULL, 0, 0, '2020-03-17 23:43:51', '2020-03-17 23:43:51', 153),
(135, 3, 64, 5.6, NULL, 0, 0, '2020-03-24 23:48:32', '2020-03-24 23:48:32', 176),
(137, 6, 66, 66, NULL, 0, 0, '2020-03-25 15:47:41', '2020-03-25 15:47:41', 179),
(138, 3, 60, 5.5, NULL, 0, 0, '2020-03-25 16:41:44', '2020-03-25 16:41:44', 180),
(139, 4, 122, 58, NULL, 0, 0, '2020-03-25 19:02:05', '2020-03-25 19:02:05', 182),
(140, 5, 59, 5.5, NULL, 0, 0, '2020-03-26 10:35:32', '2020-03-26 10:35:32', 184),
(141, 2, 50, 6, NULL, 0, 0, '2020-03-26 15:25:47', '2020-03-26 15:25:47', 187),
(142, 2, 138, 127, NULL, 0, 0, '2020-03-26 21:28:24', '2020-03-26 21:28:24', 188),
(143, 5, 231, 123, NULL, 0, 0, '2020-03-26 21:50:09', '2020-03-26 21:50:09', 190),
(144, 3, 66, 66, NULL, 0, 0, '2020-03-31 16:56:37', '2020-03-31 16:56:37', 196),
(145, 3, 5, 5555, NULL, 0, 0, '2020-03-31 20:23:38', '2020-03-31 20:23:38', 197),
(146, 4, 120, 120, NULL, 0, 0, '2020-03-31 20:37:46', '2020-03-31 20:37:46', 198);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_patient_medicine_history`
--

CREATE TABLE `tbl_patient_medicine_history` (
  `id` int(11) NOT NULL,
  `health_profile` int(11) NOT NULL,
  `medicine_name` varchar(256) DEFAULT NULL,
  `how_long` varchar(256) DEFAULT NULL,
  `state_id` int(11) NOT NULL DEFAULT '0',
  `type_id` tinyint(1) DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_patient_symptom`
--

CREATE TABLE `tbl_patient_symptom` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL DEFAULT '0',
  `type_id` tinyint(1) DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_patient_symptom`
--

INSERT INTO `tbl_patient_symptom` (`id`, `category_id`, `state_id`, `type_id`, `created_on`, `updated_on`, `created_by_id`) VALUES
(230, 1, 0, NULL, '2020-03-17 19:48:34', '2020-03-17 19:48:34', 148),
(231, 2, 0, NULL, '2020-03-17 19:48:34', '2020-03-17 19:48:34', 148),
(232, 1, 0, NULL, '2020-03-17 22:03:56', '2020-03-17 22:03:56', 151),
(233, 1, 0, NULL, '2020-03-17 23:43:51', '2020-03-17 23:43:51', 153),
(234, 2, 0, NULL, '2020-03-17 23:43:51', '2020-03-17 23:43:51', 153),
(238, 16, 0, NULL, '2020-03-24 23:48:32', '2020-03-24 23:48:32', 176),
(244, 1, 0, NULL, '2020-03-25 15:47:41', '2020-03-25 15:47:41', 179),
(246, 2, 0, NULL, '2020-03-25 16:41:44', '2020-03-25 16:41:44', 180),
(247, 1, 0, NULL, '2020-03-25 19:02:05', '2020-03-25 19:02:05', 182),
(248, 2, 0, NULL, '2020-03-25 19:02:05', '2020-03-25 19:02:05', 182),
(249, 1, 0, NULL, '2020-03-26 10:35:32', '2020-03-26 10:35:32', 184),
(250, 2, 0, NULL, '2020-03-26 10:35:32', '2020-03-26 10:35:32', 184),
(252, 1, 0, NULL, '2020-03-26 15:25:47', '2020-03-26 15:25:47', 187),
(253, 1, 0, NULL, '2020-03-26 21:28:24', '2020-03-26 21:28:24', 188),
(254, 2, 0, NULL, '2020-03-26 21:28:24', '2020-03-26 21:28:24', 188),
(256, 1, 0, NULL, '2020-03-26 21:50:09', '2020-03-26 21:50:09', 190),
(258, 1, 0, NULL, '2020-03-31 16:56:37', '2020-03-31 16:56:37', 196),
(259, 2, 0, NULL, '2020-03-31 16:56:37', '2020-03-31 16:56:37', 196),
(260, 1, 0, NULL, '2020-03-31 20:23:38', '2020-03-31 20:23:38', 197),
(261, 2, 0, NULL, '2020-03-31 20:23:38', '2020-03-31 20:23:38', 197),
(262, 1, 0, NULL, '2020-03-31 20:37:46', '2020-03-31 20:37:46', 198),
(263, 2, 0, NULL, '2020-03-31 20:37:46', '2020-03-31 20:37:46', 198);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment_gateway`
--

CREATE TABLE `tbl_payment_gateway` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci,
  `mode` tinyint(4) DEFAULT '0',
  `state_id` int(11) DEFAULT '0',
  `type_id` int(11) DEFAULT '0',
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment_transaction`
--

CREATE TABLE `tbl_payment_transaction` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `model_id` int(11) DEFAULT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency` varchar(125) COLLATE utf8_unicode_ci NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payer_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `gateway_type` int(11) DEFAULT NULL,
  `payment_status` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `to_user_id` int(11) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_promocode`
--

CREATE TABLE `tbl_promocode` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `promocode` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `discount` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `valid_till` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `state_id` int(11) DEFAULT '1',
  `type_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_questions`
--

CREATE TABLE `tbl_questions` (
  `id` int(11) NOT NULL,
  `question_title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `state_id` int(11) DEFAULT '1',
  `type_id` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_question_answer`
--

CREATE TABLE `tbl_question_answer` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `state_id` int(11) DEFAULT '1',
  `type_id` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rating`
--

CREATE TABLE `tbl_rating` (
  `id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `model_type` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `rating` double NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `state_id` int(11) DEFAULT '1',
  `type_id` int(11) DEFAULT '0',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_rating`
--

INSERT INTO `tbl_rating` (`id`, `model_id`, `model_type`, `rating`, `title`, `comment`, `state_id`, `type_id`, `created_on`, `updated_on`, `created_by_id`) VALUES
(4, 174, 'app\\models\\User', 1, '', NULL, 1, 0, '2020-03-25 16:43:58', '2020-03-25 16:43:58', 180),
(5, 173, 'app\\models\\User', 5, '', NULL, 1, 0, '2020-03-25 20:16:03', '2020-03-25 20:16:03', 151),
(6, 181, 'app\\models\\User', 5, '', NULL, 1, 0, '2020-03-25 20:17:05', '2020-03-25 20:17:05', 151),
(7, 173, 'app\\models\\User', 5, '', NULL, 1, 0, '2020-03-26 01:36:28', '2020-03-26 01:36:28', 153),
(8, 173, 'app\\models\\User', 4, '', NULL, 1, 0, '2020-03-26 10:35:50', '2020-03-26 10:35:50', 184),
(9, 173, 'app\\models\\User', 5, '', NULL, 1, 0, '2020-03-26 15:54:55', '2020-03-26 15:54:55', 187);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_recommendation`
--

CREATE TABLE `tbl_recommendation` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state_id` int(11) DEFAULT '0',
  `type_id` int(11) DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_seo`
--

CREATE TABLE `tbl_seo` (
  `id` int(11) NOT NULL,
  `route` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_seo_analytics`
--

CREATE TABLE `tbl_seo_analytics` (
  `id` int(11) NOT NULL,
  `account` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `domain_name` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `additional_information` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state_id` int(11) NOT NULL DEFAULT '1',
  `type_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_seo_redirect`
--

CREATE TABLE `tbl_seo_redirect` (
  `id` int(11) NOT NULL,
  `old_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `new_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state_id` int(11) NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_setting`
--

CREATE TABLE `tbl_setting` (
  `id` int(11) NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci,
  `type_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state_id` int(11) DEFAULT '0',
  `created_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_setting`
--

INSERT INTO `tbl_setting` (`id`, `key`, `title`, `value`, `type_id`, `state_id`, `created_by_id`) VALUES
(1, 'appConfig', 'App Configration', '{\"companyUrl\":{\"type\":0,\"value\":\"https://www.toxsl.com\",\"required\":true},\"company\":{\"type\":0,\"value\":\"ToXSL Technologies\",\"required\":true},\"companyEmail\":{\"type\":0,\"value\":\"admin@toxsl.in\",\"required\":true},\"companyContactEmail\":{\"type\":0,\"value\":\"admin@toxsl.in\",\"required\":false},\"companyContactNo\":{\"type\":0,\"value\":\"9569127788\",\"required\":false},\"companyAddress\":{\"type\":0,\"value\":\"C-127, 4th floor, Phase 8, Industrial Area, Sector 72, Mohali, Punjab\",\"required\":false},\"loginCount\":{\"type\":2,\"value\":2,\"required\":false}}', NULL, 0, NULL),
(2, 'smtp', 'SMTP Configration', '{\"host\":{\"type\":0,\"value\":\"\",\"required\":true},\"username\":{\"type\":0,\"value\":\"\",\"required\":true},\"password\":{\"type\":0,\"value\":\"\",\"required\":true},\"port\":{\"type\":0,\"value\":\"\",\"required\":true},\"encryption\":{\"type\":0,\"value\":\"\",\"required\":false}}', NULL, 0, NULL),
(3, 'stripe', 'Stripe Configration', '{\"stripeKey\":{\"type\":0,\"value\":\"sk_test_oxorbKKcqQsgaJvGMBL1vOjz\",\"required\":true}}', NULL, 0, NULL),
(4, 'openTok', 'Open Tok Configration', '{\"apiKey\":{\"type\":0,\"value\":\"46269382\",\"required\":true},\"secretKey\":{\"type\":0,\"value\":\"730cef9da60f3e38efccfbe2947ea5add582b680\",\"required\":true}}', NULL, 0, NULL),
(5, 'appUrl', 'App Url', '{\"android\":{\"type\":0,\"value\":\"\",\"required\":true},\"ios\":{\"type\":0,\"value\":\"\",\"required\":true}}', NULL, 0, NULL),
(6, 'twilio', 'Twilio Settings', '{\"sid\":{\"type\":0,\"value\":\"sid\",\"required\":true},\"token\":{\"type\":0,\"value\":\"token\",\"required\":true},\"from_number\":{\"type\":0,\"value\":\"number\",\"required\":true}}', NULL, 0, NULL),
(7, 'comission', 'Comission Percentage', '{\"percentage\":{\"value\":\"40\",\"type\":\"2\",\"required\":\"1\"}}', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shadow`
--

CREATE TABLE `tbl_shadow` (
  `id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `state_id` int(11) DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subscribed_users`
--

CREATE TABLE `tbl_subscribed_users` (
  `id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `payment_status` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT '1',
  `type_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subscription`
--

CREATE TABLE `tbl_subscription` (
  `id` int(11) NOT NULL,
  `price` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `state_id` int(11) DEFAULT '1',
  `type_id` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sub_category`
--

CREATE TABLE `tbl_sub_category` (
  `id` int(11) NOT NULL,
  `title` varchar(256) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL DEFAULT '0',
  `type_id` tinyint(1) DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_sub_category`
--

INSERT INTO `tbl_sub_category` (`id`, `title`, `category_id`, `state_id`, `type_id`, `created_on`, `updated_on`, `created_by_id`) VALUES
(1, 'General Symptoms', 1, 1, 0, '2020-03-30 14:16:54', '2020-03-30 14:16:54', 1),
(2, 'Head/Neck', 1, 1, 0, '2020-03-30 14:20:46', '2020-03-30 14:20:46', 1),
(4, 'General Symptoms', 2, 1, 0, '2020-03-31 12:00:02', '2020-03-31 12:00:02', 1),
(5, 'General Symptoms', 16, 1, 0, '2020-03-31 12:14:00', '2020-03-31 12:14:00', 1),
(6, 'Infection', 16, 1, 0, '2020-03-31 12:19:13', '2020-03-31 12:19:13', 1),
(7, 'eyes/heart/lungs', 2, 1, 0, '2020-03-31 12:20:11', '2020-03-31 12:20:11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_team`
--

CREATE TABLE `tbl_team` (
  `id` int(11) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `designation` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `image_file` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `state_id` int(11) DEFAULT '1',
  `type_id` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_testimonials`
--

CREATE TABLE `tbl_testimonials` (
  `id` int(11) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `designation` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `image_file` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `state_id` int(11) DEFAULT '1',
  `type_id` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_thermometer_location`
--

CREATE TABLE `tbl_thermometer_location` (
  `id` int(11) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `state_id` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` int(11) DEFAULT '0',
  `age` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about_me` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qualification` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `specialization` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `speciality` longtext COLLATE utf8_unicode_ci,
  `latitude` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_verified` tinyint(1) DEFAULT '0',
  `profile_file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tos` int(11) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL DEFAULT '0',
  `notification_settings` int(11) NOT NULL DEFAULT '1',
  `email_settings` int(11) NOT NULL DEFAULT '1',
  `last_visit_time` datetime DEFAULT NULL,
  `last_action_time` datetime DEFAULT NULL,
  `last_password_change` datetime DEFAULT NULL,
  `login_error_count` int(11) DEFAULT NULL,
  `activation_key` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_token` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `first_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `current_place_of_work` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `full_name`, `email`, `password`, `date_of_birth`, `gender`, `age`, `about_me`, `qualification`, `specialization`, `contact_no`, `address`, `speciality`, `latitude`, `longitude`, `city`, `country`, `zipcode`, `language`, `email_verified`, `profile_file`, `tos`, `role_id`, `state_id`, `type_id`, `notification_settings`, `email_settings`, `last_visit_time`, `last_action_time`, `last_password_change`, `login_error_count`, `activation_key`, `access_token`, `timezone`, `created_on`, `updated_on`, `created_by_id`, `first_name`, `last_name`, `current_place_of_work`) VALUES
(1, 'Admin', 'admin@toxsl.in', '$2y$13$btP9j4kzcp9cqi0HQL3QLOM0eB9dlBM8JAFsjKL1rSmBlAQ356RMa', NULL, 0, NULL, NULL, NULL, NULL, '9876543210', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'user-1583479420-profile_file-user_id_1.png', NULL, 0, 1, 0, 1, 1, '2020-04-02 17:44:02', NULL, NULL, NULL, '9W6ig2vYmAlXPEw6F275nO_YifUAHKAw_1583472045', 'dEllU0YM8d292bn5rXNwSHHOpjPKUpj_', NULL, '2020-03-06 10:50:44', '2020-03-06 12:53:40', NULL, '', '', NULL),
(148, '', 'ashish@t.in', '$2y$13$CWtUE/vYnWSwe81gdI1GI.dFleEtD.AX88RmSucnMxtAtz89WVcnq', '2014-03-17', 0, '', '', NULL, NULL, '101010', 'Mohali, punjab', NULL, '', '', '', 'India', '', '', 1, 'user-1584454714-profile_file-user_id_.jpg', NULL, 4, 1, 0, 1, 1, '2020-03-27 11:59:21', NULL, NULL, NULL, '', '7QdwvqFNWqpg3KWCuoOsXv382lWWjBiz', '', '2020-03-17 19:48:34', '2020-03-17 19:48:34', NULL, 'Ashish', 'Kumar', NULL),
(151, '', 'osae07@gmail.com', '$2y$13$y/ajGXqKtVJCBu7QJ/vbGuqYcdgs5oa2hRYZkB5WJFnY4XKIKrxym', '1997-03-11', 0, '', '', NULL, NULL, '08164154882', 'Sggggggggggg', NULL, '', '', '', 'Nigeria', '', '', 1, 'user-1584462836-profile_file-user_id_.jpg', NULL, 4, 1, 0, 1, 1, '2020-03-26 21:25:13', NULL, NULL, NULL, '', '', '', '2020-03-17 22:03:56', '2020-03-17 22:03:56', NULL, 'Reg', 'Enforcement', NULL),
(153, '', 'James.Abechi@signaladoc.com', '$2y$13$o8kJkqjXCnQqnNAbzSh3x.V0F5EOVwnbLsByTgmph6fKBeSHUfNK.', '1987-03-17', 0, '', '', NULL, NULL, '123456789', 'Abuja', NULL, '', '', '', 'Nigeria', '', '', 1, 'user-1584468831-profile_file-user_id_.jpg', NULL, 4, 1, 0, 1, 1, '2020-04-02 14:55:05', NULL, NULL, NULL, '', '8l2w18Be1vl9PN-Gezt4FAAdaVpVqCDD', '', '2020-03-17 23:43:51', '2020-03-17 23:44:52', NULL, 'John', 'Doe', NULL),
(176, '', 'kenechiibeanu@gmail.com', '$2y$13$AGeZCoE0reUsQjXcQYYU9.s00RFeUFgZqktpOKIks02Y.CVs7ieKy', '1900-02-27', 0, '', '', NULL, NULL, '09021746775', '15 vickson, dehli', NULL, '', '', '', 'India', '', '', 1, 'user-1585073912-profile_file-user_id_.jpg', NULL, 4, 1, 0, 1, 1, '2020-04-01 00:22:01', NULL, NULL, NULL, '', 'd-1_JzQiBTPBXdcpazvM83fS_8ML7yyI', '', '2020-03-24 23:48:32', '2020-03-24 23:48:32', NULL, 'kenne', 'ibeanu', NULL),
(179, 'Pass Singh', 'pass@signal.com', '$2y$13$PxohWGenJagSGHxaEuOYFOtMEAn5vmkq3Iy1m/3WjQqEOWneSrXZW', '2020-03-25', 0, '', '', NULL, NULL, '65643634', 'Mohali phase 8', NULL, '', '', '', 'India', '', '', 1, 'user-1585131461-profile_file-user_id_.jpg', NULL, 4, 1, 0, 1, 1, '2020-04-02 19:00:49', NULL, NULL, NULL, '', 'tfNUb3yrmingrDMcopLCmBKQSQgIh0cr', '', '2020-03-25 15:47:41', '2020-03-25 15:47:41', NULL, 'Pass', 'Singh', NULL),
(180, 'Ram Kumar', 'ram@g.in', '$2y$13$rXnbCzLahY6imgmiU.wb1Ogw1vbXfHAv.rlspRGo8g/tvhCGhvdRe', '2020-03-24', 0, '', '', NULL, NULL, '123456789', 'Mohali', NULL, '', '', '', 'India', '', '', 1, 'user-1585134704-profile_file-user_id_.jpg', NULL, 4, 1, 0, 1, 1, '2020-03-25 17:09:14', NULL, NULL, NULL, '', 'Ey6IqFuUtMZSSUv2qguB_YcuVpxVqpO_', '', '2020-03-25 16:41:44', '2020-03-25 16:47:36', NULL, 'Ram', 'Kumar', NULL),
(182, 'T Y', 't@gmail.com', '$2y$13$g/ktgn8Gv7IPvIcUwjCWreU1RlpapG6aOuMnH1O4c.PaTmMXCigj6', '2020-02-11', 0, '', '', NULL, NULL, '1213848409', 'Vshsb sb', NULL, '', '', '', 'India', '', '', 1, 'user-1585143125-profile_file-user_id_.jpg', NULL, 4, 1, 0, 1, 1, '2020-03-25 19:02:40', NULL, NULL, NULL, '', '2OzZqp9MVN4_wgAQPrtVuaklUe_Za926', '', '2020-03-25 19:02:05', '2020-03-25 19:02:05', NULL, 'T', 'Y', NULL),
(184, 'Riya Mahajan', 'riya@signal.com', '$2y$13$QoGNUBz6PVob/y/tRNC.FugpKgq65V.ddtctVqevJcX/zGI5gR4uC', '2013-03-26', 0, '', '', NULL, NULL, '65643634', 'Mohali phase 8', NULL, '', '', '', 'India', '', '', 1, 'user-1585199132-profile_file-user_id_.jpg', NULL, 4, 1, 0, 1, 1, '2020-04-02 19:00:54', NULL, NULL, NULL, '', 'LYAjfauPtHlTGHAPtTfvf4Juziar1N2v', '', '2020-03-26 10:35:32', '2020-03-26 10:35:32', NULL, 'Riya', 'Mahajan', NULL),
(187, 'Admin Patient', 'adminpatient@doctor.com', '$2y$13$I3SRchSs951zzsqUWf45xOsgebZtXTfoD1N9uFnwitZ3pJpNsjtbO', '1980-03-26', 0, '', '', NULL, NULL, '9000160002', 'Ahaj', NULL, '', '', '', 'India', '', '', 1, 'user-1585216547-profile_file-user_id_.jpg', NULL, 4, 1, 0, 1, 1, '2020-03-26 16:23:13', NULL, NULL, NULL, '', '5m0WE_VHXAP1mu6SDV29GmmVZOKB8PR2', '', '2020-03-26 15:25:47', '2020-03-26 15:25:47', NULL, 'Admin', 'Patient', NULL),
(188, 'Black Box', 'sony@gmail.com', '$2y$13$YHkNpyS287.tesIiP1CJxO3GP8tyCHO5ZOEiVV0yBBGQzJJlj4UFa', '1989-03-26', 0, '', '', NULL, NULL, '0813211372', 'GgggggGkkkkkkkkkkk', NULL, '', '', '', 'Nigeria', '', '', 1, 'user-1585238304-profile_file-user_id_.jpg', NULL, 4, 1, 0, 1, 1, NULL, NULL, NULL, NULL, '', 'iyLaY9O7WcHDjjgjFZ4TZ2tObtFJE5xu', '', '2020-03-26 21:28:24', '2020-03-26 21:28:24', NULL, 'Black', 'Box', NULL),
(190, 'Downing Streer', 'liz@gmail.com', '$2y$13$CVvHS8oNO0orn13Q1CL8yum1kLNveharVk8.LP/hlO.c61v4z95Z.', '1995-03-26', 0, '', '', NULL, NULL, '08054481231', 'Yyyyyyyyyyyyyy', NULL, '', '', '', 'Nigeria', '', '', 1, 'user-1585239609-profile_file-user_id_.jpg', NULL, 4, 1, 0, 1, 1, '2020-03-31 21:58:47', NULL, NULL, NULL, '', 'mq3RGTG2FYUl9wMbxlDACsM-RHybcWZH', '', '2020-03-26 21:50:09', '2020-03-26 21:50:09', NULL, 'Downing', 'Streer', NULL),
(196, 'Pass doc Singh', 'passDoc@signal.com', '$2y$13$N/Z74famUgZVtiwVUHGQteHl2JETgsSwwZzzok7I84j9XSOeuFkrm', '2020-03-31', 0, '', '', NULL, NULL, '65643634', 'Mohali phase 8', NULL, '', '', '', 'India', '', '', 1, 'user-1585653997-profile_file-user_id_.jpg', NULL, 4, 1, 0, 1, 1, '2020-04-02 15:37:43', NULL, NULL, NULL, '', 'K4hkMgoMfastfJwMyWHFgo_Pg8wmVf0Y', '', '2020-03-31 16:56:37', '2020-03-31 16:56:37', NULL, 'Pass doc', 'Singh', NULL),
(197, 'Yes Jo', 'toun_99@gmail.com', '$2y$13$xVs6s5/IM7FRi3RlGyn2k.5.3EzaIliRFDLq6bI4r3dg8V5UNs8vm', '1995-03-31', 0, '', '', NULL, NULL, '08054661213', 'Hhhhhhhhhhh', NULL, '', '', '', 'Nigeria', '', '', 1, 'user-1585666418-profile_file-user_id_.jpg', NULL, 4, 1, 0, 1, 1, NULL, NULL, NULL, NULL, '', 'vwudO8yGddCzgHL9zxIHsUjM2Kb7cErY', '', '2020-03-31 20:23:38', '2020-03-31 20:23:38', NULL, 'Yes', 'Jo', NULL),
(198, 'Y0 Rea', 'toun99@gmail.com', '$2y$13$8RaDLeez28zVqgfR/sVPCOQq86R53ogkl9tJX28tCKmj.11nECnFO', '1990-03-31', 0, '', '', NULL, NULL, '0805631158', 'Trtttttttt', NULL, '', '', '', 'Nigeria', '', '', 1, 'user-1585667266-profile_file-user_id_.jpg', NULL, 4, 1, 0, 1, 1, '2020-04-01 00:21:59', NULL, NULL, NULL, '', 'iZR_5HNw2uEquDzBYn62GpljUap8Wr8A', '', '2020-03-31 20:37:46', '2020-03-31 20:37:46', NULL, 'Y0', 'Rea', NULL),
(200, 'James James', 'pass@doctor.com', '$2y$13$.fF/FoNkcle7PPgjYFsqr.epGgrKL52oRE31ACCNWlPGa/RDp.YGS', NULL, 0, NULL, NULL, NULL, NULL, '65643634', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'user-1585829859-profile_file-user_id_.jpg', NULL, 3, 1, 0, 1, 1, '2020-04-02 17:50:24', NULL, NULL, NULL, NULL, '', NULL, '2020-04-02 17:47:39', '2020-04-02 17:47:39', NULL, 'James', 'James', 'hxhdh'),
(201, 'Riya Mahajan', 'riya@doctor.com', '$2y$13$8T9MGekWdlIgcMDCdFZnjO2HyPFIOcocVToPEBFDAeXn7Hnc.tOKq', NULL, 0, NULL, NULL, NULL, NULL, '65643634', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'user-1585830075-profile_file-user_id_.jpg', NULL, 3, 1, 0, 1, 1, '2020-04-02 18:06:36', NULL, NULL, NULL, NULL, 'VbjhFO335duaDNHy8LwP3lqZ0v5qWZsi', NULL, '2020-04-02 17:51:15', '2020-04-02 17:51:15', NULL, 'Riya', 'Mahajan', 'hhhh'),
(202, 'Pass Doc', 'passdoc@doctor.com', '$2y$13$q9mW0lPspDX11I9v0hC5TehnMapeDrKYA8sNZvv4y1U11WcQWaEra', NULL, 0, NULL, NULL, NULL, NULL, '65643634', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'user-1585830202-profile_file-user_id_.jpg', NULL, 3, 1, 0, 1, 1, '2020-04-02 18:05:56', NULL, NULL, NULL, NULL, '', NULL, '2020-04-02 17:53:22', '2020-04-02 17:53:22', NULL, 'Pass', 'Doc', 'hsjdj');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_recommendation`
--

CREATE TABLE `tbl_user_recommendation` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `recommendation_id` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `state_id` int(11) NOT NULL DEFAULT '1',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_speciality`
--

CREATE TABLE `tbl_user_speciality` (
  `id` int(11) NOT NULL,
  `speciality_id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `state_id` int(11) NOT NULL DEFAULT '1',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_wallet`
--

CREATE TABLE `tbl_user_wallet` (
  `id` int(11) NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `state_id` int(11) NOT NULL DEFAULT '0',
  `type_id` tinyint(1) DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_wallet`
--

INSERT INTO `tbl_user_wallet` (`id`, `amount`, `state_id`, `type_id`, `created_on`, `updated_on`, `created_by_id`) VALUES
(1, 0, 1, NULL, '2020-03-06 13:22:24', '2020-03-06 13:22:24', 2),
(133, 0, 1, NULL, '2020-03-17 19:48:34', '2020-03-17 19:48:34', 148),
(134, 0, 1, NULL, '2020-03-17 22:03:56', '2020-03-17 22:03:56', 151),
(135, 0, 1, NULL, '2020-03-17 23:43:51', '2020-03-17 23:43:51', 153),
(140, 0, 1, NULL, '2020-03-24 23:48:32', '2020-03-24 23:48:32', 176),
(142, 0, 1, NULL, '2020-03-25 15:47:41', '2020-03-25 15:47:41', 179),
(143, 0, 1, NULL, '2020-03-25 16:41:44', '2020-03-25 16:41:44', 180),
(144, 0, 1, NULL, '2020-03-25 19:02:05', '2020-03-25 19:02:05', 182),
(145, 0, 1, NULL, '2020-03-26 10:35:32', '2020-03-26 10:35:32', 184),
(146, 0, 1, NULL, '2020-03-26 15:25:47', '2020-03-26 15:25:47', 187),
(147, 0, 1, NULL, '2020-03-26 21:28:24', '2020-03-26 21:28:24', 188),
(148, 0, 1, NULL, '2020-03-26 21:50:09', '2020-03-26 21:50:09', 190),
(149, 0, 1, NULL, '2020-03-31 16:56:37', '2020-03-31 16:56:37', 196),
(150, 0, 1, NULL, '2020-03-31 20:23:38', '2020-03-31 20:23:38', 197),
(151, 0, 1, NULL, '2020-03-31 20:37:46', '2020-03-31 20:37:46', 198);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wallet_history`
--

CREATE TABLE `tbl_wallet_history` (
  `id` int(11) NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `to_user_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL DEFAULT '0',
  `type_id` tinyint(1) DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_work_profile`
--

CREATE TABLE `tbl_work_profile` (
  `id` int(11) NOT NULL,
  `professional_status` int(11) NOT NULL,
  `professional_indemnity` tinyint(1) DEFAULT '0',
  `professional_indemnity_certificate` varchar(255) DEFAULT NULL,
  `MDCN_folio_number` int(11) NOT NULL,
  `MDCN_certificate` varchar(255) DEFAULT NULL,
  `registeration_number` varchar(255) DEFAULT NULL,
  `issued_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `profile_summary` text,
  `state_id` int(11) NOT NULL DEFAULT '0',
  `type_id` tinyint(1) DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_work_profile`
--

INSERT INTO `tbl_work_profile` (`id`, `professional_status`, `professional_indemnity`, `professional_indemnity_certificate`, `MDCN_folio_number`, `MDCN_certificate`, `registeration_number`, `issued_date`, `expiry_date`, `profile_summary`, `state_id`, `type_id`, `created_on`, `updated_on`, `created_by_id`) VALUES
(15, 1, 0, NULL, 23754649, 'user-1584457941-MDCN_certificate-user_id_.jpg', '637373hhj777', '2019-03-17', '2019-03-17', 'Great guy', 0, NULL, '2020-03-17 20:42:21', '2020-03-17 20:42:21', 150),
(16, 1, 0, NULL, 1264567, 'user-1584463959-MDCN_certificate-user_id_.jpg', '12356491', '2019-03-17', '2020-03-16', 'Dhhhhhhhhhhhh', 0, NULL, '2020-03-17 22:22:39', '2020-03-17 22:22:39', 152),
(17, 1, 1, 'user-1584516104-professional_indemnity_certificate-user_id_.jpg', 848787, 'user-1584516104-MDCN_certificate-user_id_.jpg', 'Tedt', '2020-03-18', '2020-03-31', 'Yesss', 0, NULL, '2020-03-18 12:51:44', '2020-03-18 12:51:44', 154),
(28, 1, 0, NULL, 949595, 'user-1585027299-MDCN_certificate-user_id_.jpg', 'Vsgegge', '2020-03-24', '2020-03-24', 'Gsgge', 0, NULL, '2020-03-24 10:51:39', '2020-03-24 10:51:39', 170),
(29, 1, 0, NULL, 456, '1', '11447799', '2020-01-22', '2020-01-22', 'test profile summary', 0, NULL, '2020-03-24 14:44:37', '2020-03-24 14:44:37', 172),
(45, 2, 1, 'user-1585829859-professional_indemnity_certificate-user_id_.jpg', 68686, 'user-1585829859-MDCN_certificate-user_id_.jpg', 'Hxhxh', '2020-04-02', '2020-04-02', 'Hdjdj', 0, NULL, '2020-04-02 17:47:39', '2020-04-02 17:47:39', 200),
(46, 3, 1, 'user-1585830075-professional_indemnity_certificate-user_id_.jpg', 6666, 'user-1585830075-MDCN_certificate-user_id_.jpg', 'Vbb', '2020-04-02', '2020-04-02', 'Bgh', 0, NULL, '2020-04-02 17:51:15', '2020-04-02 17:51:15', 201),
(47, 1, 1, 'user-1585830202-professional_indemnity_certificate-user_id_.jpg', 68686, 'user-1585830202-MDCN_certificate-user_id_.jpg', 'Bxhxj', '2020-04-02', '2020-04-02', 'Bxbxndj', 0, NULL, '2020-04-02 17:53:22', '2020-04-02 17:53:22', 202);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_api_device_detail`
--
ALTER TABLE `tbl_api_device_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_api_device_detail_create_user` (`created_by_id`);

--
-- Indexes for table `tbl_appointment`
--
ALTER TABLE `tbl_appointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_appointment_created_by` (`created_by_id`),
  ADD KEY `fk_appointment_doctor_id` (`doctor_id`),
  ADD KEY `name` (`name`),
  ADD KEY `health_issue` (`health_issue`),
  ADD KEY `reschedule_reason` (`reschedule_reason`),
  ADD KEY `cancel_reason` (`cancel_reason`);

--
-- Indexes for table `tbl_appointment_illness`
--
ALTER TABLE `tbl_appointment_illness`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_appointment_illness_created_by` (`created_by_id`),
  ADD KEY `fk_appointment_illness_id` (`illness_id`),
  ADD KEY `fk_appointment_appointment_id` (`appointment_id`),
  ADD KEY `appointment_id` (`appointment_id`),
  ADD KEY `illness_id` (`illness_id`);

--
-- Indexes for table `tbl_appointment_plans`
--
ALTER TABLE `tbl_appointment_plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_appointment_plans_created_by_id` (`created_by_id`),
  ADD KEY `fk_appointment_plans_doctor_id` (`doctor_id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `amount` (`amount`),
  ADD KEY `description` (`description`);

--
-- Indexes for table `tbl_appointment_question`
--
ALTER TABLE `tbl_appointment_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`),
  ADD KEY `state_id` (`state_id`),
  ADD KEY `FK_appointment_question_created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_appointment_question_multiple_type`
--
ALTER TABLE `tbl_appointment_question_multiple_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_appointment_question_multiple_type_created_by_id` (`created_by_id`),
  ADD KEY `FK_appointment_question_multiple_type_question_id` (`question_id`);

--
-- Indexes for table `tbl_availability_time`
--
ALTER TABLE `tbl_availability_time`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_availability_id` (`doctor_availability_id`),
  ADD KEY `time` (`start_time`),
  ADD KEY `price` (`price`),
  ADD KEY `description` (`description`),
  ADD KEY `fk_availability_time_created_by_id` (`created_by_id`),
  ADD KEY `fk_availability_time_doctor_availability` (`doctor_availability_id`);

--
-- Indexes for table `tbl_banner`
--
ALTER TABLE `tbl_banner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_banner_created_by_id` (`created_by_id`),
  ADD KEY `name` (`name`),
  ADD KEY `description` (`description`);

--
-- Indexes for table `tbl_blog_category`
--
ALTER TABLE `tbl_blog_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_blog_category_created_by_id` (`created_by_id`),
  ADD KEY `title` (`title`),
  ADD KEY `state_id` (`state_id`),
  ADD KEY `created_on` (`created_on`);

--
-- Indexes for table `tbl_call_log`
--
ALTER TABLE `tbl_call_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_call_log_created_by_id` (`created_by_id`),
  ADD KEY `fk_call_log_user_id` (`user_id`),
  ADD KEY `fk_call_log_appointment_id` (`appointment_id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_category_created_by` (`created_by_id`);

--
-- Indexes for table `tbl_category_answer`
--
ALTER TABLE `tbl_category_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_category_answer_created_by_id` (`created_by_id`),
  ADD KEY `FK_category_answer_category_id` (`question_id`);

--
-- Indexes for table `tbl_category_question`
--
ALTER TABLE `tbl_category_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_category_question_created_by_id` (`created_by_id`),
  ADD KEY `FK_category_question_category_id` (`created_by_id`);

--
-- Indexes for table `tbl_category_question_repeate_type`
--
ALTER TABLE `tbl_category_question_repeate_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_category_question_repeate_type_category_question_id` (`category_question_id`),
  ADD KEY `fk_category_question_repeate_type_created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comment_created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_consultation_availability`
--
ALTER TABLE `tbl_consultation_availability`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_consultation_availability_created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_doctor_availability`
--
ALTER TABLE `tbl_doctor_availability`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_doctor_availability_created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_doctor_consultation_availability`
--
ALTER TABLE `tbl_doctor_consultation_availability`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_doctor_consultation_availability_created_by_id` (`created_by_id`),
  ADD KEY `FK_doctor_consultation_availability_user_id` (`user_id`),
  ADD KEY `FK_doctor_consultation_availability_consultation_id` (`consultation_id`);

--
-- Indexes for table `tbl_doctor_language`
--
ALTER TABLE `tbl_doctor_language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_doctor_language_created_by_id` (`created_by_id`),
  ADD KEY `fk_doctor_language_language_id` (`language_id`);

--
-- Indexes for table `tbl_doctor_professional_status`
--
ALTER TABLE `tbl_doctor_professional_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_doctor_professional_status_created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_doctor_specialization`
--
ALTER TABLE `tbl_doctor_specialization`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_doctor_specialization_category_id` (`category_id`),
  ADD KEY `fk_doctor_specialization_created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_duration`
--
ALTER TABLE `tbl_duration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_duration_created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_email_queue`
--
ALTER TABLE `tbl_email_queue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_favorite`
--
ALTER TABLE `tbl_favorite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_favorite_doctor_id` (`doctor_id`),
  ADD KEY `fk_favorite_created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_feed`
--
ALTER TABLE `tbl_feed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_feedback_created_by` (`created_by_id`),
  ADD KEY `fk_feedback_user_id` (`user_id`);

--
-- Indexes for table `tbl_file`
--
ALTER TABLE `tbl_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_file_created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_illness`
--
ALTER TABLE `tbl_illness`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_illness_created_by` (`created_by_id`),
  ADD KEY `fk_illness_category_id` (`category_id`);

--
-- Indexes for table `tbl_language_list`
--
ALTER TABLE `tbl_language_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_log`
--
ALTER TABLE `tbl_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_login_history`
--
ALTER TABLE `tbl_login_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_message`
--
ALTER TABLE `tbl_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_migration`
--
ALTER TABLE `tbl_migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `tbl_notice`
--
ALTER TABLE `tbl_notice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_notice_created_by` (`created_by_id`);

--
-- Indexes for table `tbl_notification`
--
ALTER TABLE `tbl_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_otp`
--
ALTER TABLE `tbl_otp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_otp_created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_page`
--
ALTER TABLE `tbl_page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_page_created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_patient_allergies`
--
ALTER TABLE `tbl_patient_allergies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_patient_allergies_health_profile` (`health_profile`),
  ADD KEY `fk_patient_allergies_created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_patient_answer`
--
ALTER TABLE `tbl_patient_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_patient_answer_question_id` (`question_id`),
  ADD KEY `fk_patient_answer_answer_id` (`answer_id`),
  ADD KEY `fk_patient_answer_created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_patient_health_profile`
--
ALTER TABLE `tbl_patient_health_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_patient_health_profile_created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_patient_illness`
--
ALTER TABLE `tbl_patient_illness`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_patient_illness_health_profile` (`health_profile`),
  ADD KEY `fk_patient_illness_symptom_id` (`symptom_id`),
  ADD KEY `fk_patient_illness_illness_id` (`illness_id`),
  ADD KEY `fk_patient_illness_created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_patient_medical_information`
--
ALTER TABLE `tbl_patient_medical_information`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_medical_information_created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_patient_medicine_history`
--
ALTER TABLE `tbl_patient_medicine_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_patient_medicine_history_health_profile` (`health_profile`),
  ADD KEY `fk_patient_medicine_history_created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_patient_symptom`
--
ALTER TABLE `tbl_patient_symptom`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_patient_symptom_category_id` (`category_id`),
  ADD KEY `fk_patient_symptom_created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_payment_gateway`
--
ALTER TABLE `tbl_payment_gateway`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_payment_gateway_create_user` (`created_by_id`);

--
-- Indexes for table `tbl_payment_transaction`
--
ALTER TABLE `tbl_payment_transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_promocode`
--
ALTER TABLE `tbl_promocode`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_promocode_created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_questions`
--
ALTER TABLE `tbl_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_questions_created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_question_answer`
--
ALTER TABLE `tbl_question_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_question_answer_created_by_id` (`created_by_id`),
  ADD KEY `fk_question_answer_question_id` (`question_id`);

--
-- Indexes for table `tbl_rating`
--
ALTER TABLE `tbl_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_rating_created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_recommendation`
--
ALTER TABLE `tbl_recommendation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_recommendation_created_by` (`created_by_id`);

--
-- Indexes for table `tbl_seo`
--
ALTER TABLE `tbl_seo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seo_idx_route` (`route`);

--
-- Indexes for table `tbl_seo_analytics`
--
ALTER TABLE `tbl_seo_analytics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_seo_analytics_created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_seo_redirect`
--
ALTER TABLE `tbl_seo_redirect`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_seo_redirect_created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_setting`
--
ALTER TABLE `tbl_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_shadow`
--
ALTER TABLE `tbl_shadow`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_subscribed_users`
--
ALTER TABLE `tbl_subscribed_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_subscribed_users_created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_subscription`
--
ALTER TABLE `tbl_subscription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_subscription_created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_sub_category`
--
ALTER TABLE `tbl_sub_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_sub_category_category_id` (`category_id`),
  ADD KEY `fk_sub_category_created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_team`
--
ALTER TABLE `tbl_team`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_team_created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_testimonials`
--
ALTER TABLE `tbl_testimonials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_testimonials_created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_thermometer_location`
--
ALTER TABLE `tbl_thermometer_location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`),
  ADD KEY `state_id` (`state_id`),
  ADD KEY `FK_thermometer_location_created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user_recommendation`
--
ALTER TABLE `tbl_user_recommendation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_recommendation_created_by` (`created_by_id`),
  ADD KEY `fk_user_recommendation_patient_id` (`patient_id`),
  ADD KEY `fk_user_recommendation_recommendation_id` (`recommendation_id`);

--
-- Indexes for table `tbl_user_speciality`
--
ALTER TABLE `tbl_user_speciality`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_speciality_created_by` (`created_by_id`),
  ADD KEY `fk_user_speciality_speciality_id` (`speciality_id`);

--
-- Indexes for table `tbl_user_wallet`
--
ALTER TABLE `tbl_user_wallet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_wallet_created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_wallet_history`
--
ALTER TABLE `tbl_wallet_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_wallet_history_created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_work_profile`
--
ALTER TABLE `tbl_work_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_work_profile_professional_status` (`professional_status`),
  ADD KEY `fk_work_profile_created_by_id` (`created_by_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_api_device_detail`
--
ALTER TABLE `tbl_api_device_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;

--
-- AUTO_INCREMENT for table `tbl_appointment`
--
ALTER TABLE `tbl_appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_appointment_illness`
--
ALTER TABLE `tbl_appointment_illness`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_appointment_plans`
--
ALTER TABLE `tbl_appointment_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_appointment_question`
--
ALTER TABLE `tbl_appointment_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_appointment_question_multiple_type`
--
ALTER TABLE `tbl_appointment_question_multiple_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_availability_time`
--
ALTER TABLE `tbl_availability_time`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT for table `tbl_banner`
--
ALTER TABLE `tbl_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_blog_category`
--
ALTER TABLE `tbl_blog_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_call_log`
--
ALTER TABLE `tbl_call_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbl_category_answer`
--
ALTER TABLE `tbl_category_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_category_question`
--
ALTER TABLE `tbl_category_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_category_question_repeate_type`
--
ALTER TABLE `tbl_category_question_repeate_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_consultation_availability`
--
ALTER TABLE `tbl_consultation_availability`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_doctor_availability`
--
ALTER TABLE `tbl_doctor_availability`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT for table `tbl_doctor_consultation_availability`
--
ALTER TABLE `tbl_doctor_consultation_availability`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_doctor_language`
--
ALTER TABLE `tbl_doctor_language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tbl_doctor_professional_status`
--
ALTER TABLE `tbl_doctor_professional_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_doctor_specialization`
--
ALTER TABLE `tbl_doctor_specialization`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `tbl_duration`
--
ALTER TABLE `tbl_duration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_email_queue`
--
ALTER TABLE `tbl_email_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `tbl_favorite`
--
ALTER TABLE `tbl_favorite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_feed`
--
ALTER TABLE `tbl_feed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3352;

--
-- AUTO_INCREMENT for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_file`
--
ALTER TABLE `tbl_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_illness`
--
ALTER TABLE `tbl_illness`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_language_list`
--
ALTER TABLE `tbl_language_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=610;

--
-- AUTO_INCREMENT for table `tbl_log`
--
ALTER TABLE `tbl_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_login_history`
--
ALTER TABLE `tbl_login_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=259;

--
-- AUTO_INCREMENT for table `tbl_message`
--
ALTER TABLE `tbl_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_notice`
--
ALTER TABLE `tbl_notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_notification`
--
ALTER TABLE `tbl_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tbl_otp`
--
ALTER TABLE `tbl_otp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_page`
--
ALTER TABLE `tbl_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_patient_allergies`
--
ALTER TABLE `tbl_patient_allergies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_patient_answer`
--
ALTER TABLE `tbl_patient_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_patient_health_profile`
--
ALTER TABLE `tbl_patient_health_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_patient_illness`
--
ALTER TABLE `tbl_patient_illness`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_patient_medical_information`
--
ALTER TABLE `tbl_patient_medical_information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `tbl_patient_medicine_history`
--
ALTER TABLE `tbl_patient_medicine_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_patient_symptom`
--
ALTER TABLE `tbl_patient_symptom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=264;

--
-- AUTO_INCREMENT for table `tbl_payment_gateway`
--
ALTER TABLE `tbl_payment_gateway`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_payment_transaction`
--
ALTER TABLE `tbl_payment_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_promocode`
--
ALTER TABLE `tbl_promocode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_questions`
--
ALTER TABLE `tbl_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_question_answer`
--
ALTER TABLE `tbl_question_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_rating`
--
ALTER TABLE `tbl_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_recommendation`
--
ALTER TABLE `tbl_recommendation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_seo`
--
ALTER TABLE `tbl_seo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_seo_analytics`
--
ALTER TABLE `tbl_seo_analytics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_seo_redirect`
--
ALTER TABLE `tbl_seo_redirect`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_setting`
--
ALTER TABLE `tbl_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_shadow`
--
ALTER TABLE `tbl_shadow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_subscribed_users`
--
ALTER TABLE `tbl_subscribed_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_subscription`
--
ALTER TABLE `tbl_subscription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_sub_category`
--
ALTER TABLE `tbl_sub_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_team`
--
ALTER TABLE `tbl_team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_testimonials`
--
ALTER TABLE `tbl_testimonials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_thermometer_location`
--
ALTER TABLE `tbl_thermometer_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT for table `tbl_user_recommendation`
--
ALTER TABLE `tbl_user_recommendation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_user_speciality`
--
ALTER TABLE `tbl_user_speciality`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_user_wallet`
--
ALTER TABLE `tbl_user_wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `tbl_wallet_history`
--
ALTER TABLE `tbl_wallet_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_work_profile`
--
ALTER TABLE `tbl_work_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_api_device_detail`
--
ALTER TABLE `tbl_api_device_detail`
  ADD CONSTRAINT `fk_api_device_detail_create_user` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_appointment`
--
ALTER TABLE `tbl_appointment`
  ADD CONSTRAINT `fk_appointment_created_by` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`),
  ADD CONSTRAINT `fk_appointment_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_appointment_illness`
--
ALTER TABLE `tbl_appointment_illness`
  ADD CONSTRAINT `fk_appointment_appointment_id` FOREIGN KEY (`appointment_id`) REFERENCES `tbl_appointment` (`id`),
  ADD CONSTRAINT `fk_appointment_illness_created_by` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`),
  ADD CONSTRAINT `fk_appointment_illness_id` FOREIGN KEY (`illness_id`) REFERENCES `tbl_illness` (`id`);

--
-- Constraints for table `tbl_appointment_plans`
--
ALTER TABLE `tbl_appointment_plans`
  ADD CONSTRAINT `fk_appointment_plans_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`),
  ADD CONSTRAINT `fk_appointment_plans_user_id` FOREIGN KEY (`doctor_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_appointment_question`
--
ALTER TABLE `tbl_appointment_question`
  ADD CONSTRAINT `FK_appointment_question_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_appointment_question_multiple_type`
--
ALTER TABLE `tbl_appointment_question_multiple_type`
  ADD CONSTRAINT `FK_appointment_question_multiple_type_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`),
  ADD CONSTRAINT `FK_appointment_question_multiple_type_question_id` FOREIGN KEY (`question_id`) REFERENCES `tbl_appointment_question` (`id`);

--
-- Constraints for table `tbl_banner`
--
ALTER TABLE `tbl_banner`
  ADD CONSTRAINT `fk_banner_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_blog_category`
--
ALTER TABLE `tbl_blog_category`
  ADD CONSTRAINT `FK_blog_category_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD CONSTRAINT `fk_category_created_by` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_category_answer`
--
ALTER TABLE `tbl_category_answer`
  ADD CONSTRAINT `FK_category_answer_category_id` FOREIGN KEY (`question_id`) REFERENCES `tbl_category_question` (`id`),
  ADD CONSTRAINT `FK_category_answer_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_category_question`
--
ALTER TABLE `tbl_category_question`
  ADD CONSTRAINT `FK_category_question_category_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_category` (`id`),
  ADD CONSTRAINT `FK_category_question_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_category_question_repeate_type`
--
ALTER TABLE `tbl_category_question_repeate_type`
  ADD CONSTRAINT `fk_category_question_repeate_type_category_question_id` FOREIGN KEY (`category_question_id`) REFERENCES `tbl_category_question` (`id`),
  ADD CONSTRAINT `fk_category_question_repeate_type_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD CONSTRAINT `fk_comment_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_consultation_availability`
--
ALTER TABLE `tbl_consultation_availability`
  ADD CONSTRAINT `fk_consultation_availability_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_doctor_availability`
--
ALTER TABLE `tbl_doctor_availability`
  ADD CONSTRAINT `fk_doctor_availability_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_doctor_consultation_availability`
--
ALTER TABLE `tbl_doctor_consultation_availability`
  ADD CONSTRAINT `FK_doctor_consultation_availability_consultation_id` FOREIGN KEY (`consultation_id`) REFERENCES `tbl_consultation_availability` (`id`),
  ADD CONSTRAINT `FK_doctor_consultation_availability_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`),
  ADD CONSTRAINT `FK_doctor_consultation_availability_user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_doctor_language`
--
ALTER TABLE `tbl_doctor_language`
  ADD CONSTRAINT `fk_doctor_language_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`),
  ADD CONSTRAINT `fk_doctor_language_language_id` FOREIGN KEY (`language_id`) REFERENCES `tbl_language_list` (`id`);

--
-- Constraints for table `tbl_doctor_professional_status`
--
ALTER TABLE `tbl_doctor_professional_status`
  ADD CONSTRAINT `fk_doctor_professional_status_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_doctor_specialization`
--
ALTER TABLE `tbl_doctor_specialization`
  ADD CONSTRAINT `fk_doctor_specialization_category_id` FOREIGN KEY (`category_id`) REFERENCES `tbl_category` (`id`),
  ADD CONSTRAINT `fk_doctor_specialization_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_duration`
--
ALTER TABLE `tbl_duration`
  ADD CONSTRAINT `fk_duration_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_favorite`
--
ALTER TABLE `tbl_favorite`
  ADD CONSTRAINT `fk_favorite_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`),
  ADD CONSTRAINT `fk_favorite_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  ADD CONSTRAINT `fk_event_feedback_created_by` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`),
  ADD CONSTRAINT `fk_feedback_user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_illness`
--
ALTER TABLE `tbl_illness`
  ADD CONSTRAINT `fk_illness_category_id` FOREIGN KEY (`category_id`) REFERENCES `tbl_category` (`id`),
  ADD CONSTRAINT `fk_illness_created_by` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_notice`
--
ALTER TABLE `tbl_notice`
  ADD CONSTRAINT `fk_notice_created_by` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_page`
--
ALTER TABLE `tbl_page`
  ADD CONSTRAINT `fk_page_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_patient_allergies`
--
ALTER TABLE `tbl_patient_allergies`
  ADD CONSTRAINT `fk_patient_allergies_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`),
  ADD CONSTRAINT `fk_patient_allergies_health_profile` FOREIGN KEY (`health_profile`) REFERENCES `tbl_patient_health_profile` (`id`);

--
-- Constraints for table `tbl_patient_answer`
--
ALTER TABLE `tbl_patient_answer`
  ADD CONSTRAINT `fk_patient_answer_answer_id` FOREIGN KEY (`answer_id`) REFERENCES `tbl_category_answer` (`id`),
  ADD CONSTRAINT `fk_patient_answer_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`),
  ADD CONSTRAINT `fk_patient_answer_question_id` FOREIGN KEY (`question_id`) REFERENCES `tbl_category_question` (`id`);

--
-- Constraints for table `tbl_patient_health_profile`
--
ALTER TABLE `tbl_patient_health_profile`
  ADD CONSTRAINT `fk_patient_health_profile_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_patient_illness`
--
ALTER TABLE `tbl_patient_illness`
  ADD CONSTRAINT `fk_patient_illness_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`),
  ADD CONSTRAINT `fk_patient_illness_health_profile` FOREIGN KEY (`health_profile`) REFERENCES `tbl_patient_health_profile` (`id`),
  ADD CONSTRAINT `fk_patient_illness_illness_id` FOREIGN KEY (`illness_id`) REFERENCES `tbl_illness` (`id`),
  ADD CONSTRAINT `fk_patient_illness_symptom_id` FOREIGN KEY (`symptom_id`) REFERENCES `tbl_sub_category` (`id`);

--
-- Constraints for table `tbl_patient_medical_information`
--
ALTER TABLE `tbl_patient_medical_information`
  ADD CONSTRAINT `fk_medical_information_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_patient_medicine_history`
--
ALTER TABLE `tbl_patient_medicine_history`
  ADD CONSTRAINT `fk_patient_medicine_history_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`),
  ADD CONSTRAINT `fk_patient_medicine_history_health_profile` FOREIGN KEY (`health_profile`) REFERENCES `tbl_patient_health_profile` (`id`);

--
-- Constraints for table `tbl_patient_symptom`
--
ALTER TABLE `tbl_patient_symptom`
  ADD CONSTRAINT `fk_patient_symptom_category_id` FOREIGN KEY (`category_id`) REFERENCES `tbl_category` (`id`),
  ADD CONSTRAINT `fk_patient_symptom_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_promocode`
--
ALTER TABLE `tbl_promocode`
  ADD CONSTRAINT `fk_promocode_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_questions`
--
ALTER TABLE `tbl_questions`
  ADD CONSTRAINT `fk_questions_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_question_answer`
--
ALTER TABLE `tbl_question_answer`
  ADD CONSTRAINT `fk_question_answer_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`),
  ADD CONSTRAINT `fk_question_answer_question_id` FOREIGN KEY (`question_id`) REFERENCES `tbl_questions` (`id`);

--
-- Constraints for table `tbl_rating`
--
ALTER TABLE `tbl_rating`
  ADD CONSTRAINT `FK_rating_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_recommendation`
--
ALTER TABLE `tbl_recommendation`
  ADD CONSTRAINT `fk_recommendation_created_by` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_seo_analytics`
--
ALTER TABLE `tbl_seo_analytics`
  ADD CONSTRAINT `fk_seo_analytics_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_seo_redirect`
--
ALTER TABLE `tbl_seo_redirect`
  ADD CONSTRAINT `fk_seo_redirect_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_subscribed_users`
--
ALTER TABLE `tbl_subscribed_users`
  ADD CONSTRAINT `fk_subscribed_users_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_subscription`
--
ALTER TABLE `tbl_subscription`
  ADD CONSTRAINT `fk_subscription_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_sub_category`
--
ALTER TABLE `tbl_sub_category`
  ADD CONSTRAINT `fk_sub_category_category_id` FOREIGN KEY (`category_id`) REFERENCES `tbl_category` (`id`),
  ADD CONSTRAINT `fk_sub_category_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_team`
--
ALTER TABLE `tbl_team`
  ADD CONSTRAINT `fk_team_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_testimonials`
--
ALTER TABLE `tbl_testimonials`
  ADD CONSTRAINT `fk_testimonials_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_thermometer_location`
--
ALTER TABLE `tbl_thermometer_location`
  ADD CONSTRAINT `FK_thermometer_location_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_user_recommendation`
--
ALTER TABLE `tbl_user_recommendation`
  ADD CONSTRAINT `fk_user_recommendation_created_by` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`),
  ADD CONSTRAINT `fk_user_recommendation_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `tbl_user` (`id`),
  ADD CONSTRAINT `fk_user_recommendation_recommendation_id` FOREIGN KEY (`recommendation_id`) REFERENCES `tbl_recommendation` (`id`);

--
-- Constraints for table `tbl_user_speciality`
--
ALTER TABLE `tbl_user_speciality`
  ADD CONSTRAINT `fk_user_speciality_category` FOREIGN KEY (`speciality_id`) REFERENCES `tbl_category` (`id`),
  ADD CONSTRAINT `fk_user_speciality_created_by` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_user_wallet`
--
ALTER TABLE `tbl_user_wallet`
  ADD CONSTRAINT `fk_user_wallet_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_wallet_history`
--
ALTER TABLE `tbl_wallet_history`
  ADD CONSTRAINT `fk_wallet_history_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_work_profile`
--

ALTER TABLE `tbl_appointment` ADD `doctor_notes` TEXT NULL AFTER `prescription_image`;
ALTER TABLE `tbl_appointment` ADD `patient_id` INT(11) NOT NULL AFTER `doctor_id`;



ALTER TABLE `tbl_work_profile`
  ADD CONSTRAINT `fk_work_profile_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`),
  ADD CONSTRAINT `fk_work_profile_professional_status` FOREIGN KEY (`professional_status`) REFERENCES `tbl_doctor_professional_status` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
