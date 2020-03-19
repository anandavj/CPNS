-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Mar 2020 pada 07.47
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cpns`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'undefined');

-- --------------------------------------------------------

--
-- Struktur dari tabel `delivery_order`
--

CREATE TABLE `delivery_order` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `reference_number` varchar(20) NOT NULL,
  `receiver_name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `date` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `type` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `delivery_order`
--

INSERT INTO `delivery_order` (`id`, `name`, `reference_number`, `receiver_name`, `address`, `description`, `date`, `status`, `type`) VALUES
(21, 'Pengiriman ke x', '2020-03-10', 'Ananda', 'Lab A', 'tidak ada', '2020-03-10', 'Belum Diproses', 1),
(24, 'a', 'a', 'a', 'a', 'a', '2020-03-11', 'Belum Diproses', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `group_task`
--

CREATE TABLE `group_task` (
  `id` int(11) NOT NULL,
  `user_task_group_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `group_task`
--

INSERT INTO `group_task` (`id`, `user_task_group_id`, `task_id`) VALUES
(10, 3, 4),
(12, 3, 1),
(29, 19, 5),
(30, 20, 5),
(31, 20, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `image` text NOT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `image`
--

INSERT INTO `image` (`id`, `image`, `category_id`) VALUES
(3, 'res/sdofsoeoooe.png', 2),
(11, 'res/asdfsafdasdfasdfasd.jpg', 3),
(12, 'res/sdofsoeoooe.png', 2),
(15, 'res/sdofsoeoooe.png', 2),
(16, 'res/sdofsoeoooe.png', 2),
(17, 'res/sdofsoeoooe.png', 2),
(18, 'res/sdofsoeoooe.png', 2),
(20, 'res/sdofsoeoooe.png', 2),
(21, 'res/sdofsoeoooe.png', 2),
(22, 'res/sdofsoeoooe.png', 2),
(23, 'res/sdofsoeoooe.png', 2),
(27, 'res/sdofsoeoooe.png', 2),
(28, 'res/sdofsoeoooe.png', 2),
(29, 'res/sdofsoeoooe.png', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `product_code` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `specification` varchar(200) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `unit_id` int(11) DEFAULT NULL,
  `open_price` bigint(20) NOT NULL,
  `bottom_price` bigint(20) NOT NULL,
  `retail_id` varchar(20) NOT NULL,
  `min_stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`id`, `product_code`, `name`, `specification`, `category_id`, `description`, `stock`, `unit_id`, `open_price`, `bottom_price`, `retail_id`, `min_stock`) VALUES
(1, 'undefined', 'Smartruss Truecore C.75.100 ra', '9 m', 1, NULL, 0, 1, 276210, 0, 'undefined', 0),
(2, 'undefined', 'Smartruss Truecore C.75.75 ra', '9 m', 1, NULL, 0, 1, 214830, 0, 'undefined', 0),
(3, 'undefined', 'Smartruss Truecore C.75.70 ra', '9 m', 1, NULL, 0, 1, 212850, 0, 'undefined', 0),
(4, 'undefined', 'Smartruss Truecore C.75.60 ra', '9 m', 1, NULL, 0, 1, 186120, 0, 'undefined', 0),
(5, 'undefined', 'Smartruss Truecore C.75.100 sa', '9 m', 1, NULL, 0, 1, 250470, 0, 'undefined', 0),
(6, 'undefined', 'Smartruss Truecore C.75.75 sa', '9 m', 1, NULL, 0, 1, 195030, 0, 'undefined', 0),
(7, 'undefined', 'Smartruss Truecore C.75.70 sa', '9 m', 1, NULL, 0, 1, 194040, 0, 'undefined', 0),
(8, 'undefined', 'Smartruss Truecore C.75.60 sa', '9 m', 1, NULL, 0, 1, 169290, 0, 'undefined', 0),
(9, 'undefined', 'Smartruss Truecore TS.40.045 (RENG)', '5.6 m', 1, NULL, 0, 1, 81180, 0, 'undefined', 0),
(10, 'undefined', 'Smartruss Truecore TS.35.045 (RENG)', '5.6 m', 1, NULL, 0, 1, 62040, 0, 'undefined', 0),
(11, 'undefined', 'Smartruss C.75.100 ra', '9 m', 1, NULL, 0, 1, 243540, 0, 'undefined', 0),
(12, 'undefined', 'Smartruss C.75.75 ra', '9 m', 1, NULL, 0, 1, 187110, 0, 'undefined', 0),
(13, 'undefined', 'Smartruss C.75.70 ra', '9 m', 1, NULL, 0, 1, 177210, 0, 'undefined', 0),
(14, 'undefined', 'Smartruss C.75.60 ra', '9 m', 1, NULL, 0, 1, 156420, 0, 'undefined', 0),
(15, 'undefined', 'Smartruss C.75.100 sa', '9 m', 1, NULL, 0, 1, 226710, 0, 'undefined', 0),
(16, 'undefined', 'Smartruss C.75.75 sa', '9 m', 1, NULL, 0, 1, 175230, 0, 'undefined', 0),
(17, 'undefined', 'Smartruss C.75.70 sa', '9 m', 1, NULL, 0, 1, 165330, 0, 'undefined', 0),
(18, 'undefined', 'Smartruss C.75.60 sa', '9 m', 1, NULL, 0, 1, 145530, 0, 'undefined', 0),
(19, 'undefined', 'Smartruss TS.40.045 (RENG)', '5.6 m', 1, NULL, 0, 1, 69960, 0, 'undefined', 0),
(20, 'undefined', 'Smartruss TS.35.045 (RENG)', '5.6 m', 1, NULL, 0, 1, 54120, 0, 'undefined', 0),
(21, 'undefined', 'PAKSA TRUSS C.75.100', '6m', 1, NULL, 0, 1, 109000, 0, 'undefined', 0),
(22, 'undefined', 'PAKSA TRUSS C.75.080', '6m', 1, NULL, 0, 1, 83000, 0, 'undefined', 0),
(23, 'undefined', 'PAKSA TRUSS C75.075 ', '6m', 1, NULL, 0, 1, 74000, 0, 'undefined', 0),
(24, 'undefined', 'IH TRUSS C75.075 E', '6m', 1, NULL, 0, 1, 71000, 0, 'undefined', 0),
(25, 'undefined', 'R.32.045 (A)', '6m', 1, NULL, 0, 1, 36000, 0, 'undefined', 0),
(26, 'undefined', 'R.32.045 (B)', '6m', 1, NULL, 0, 1, 36000, 0, 'undefined', 0),
(27, 'undefined', 'R.32.045E (C)', '6m', 1, NULL, 0, 1, 35000, 0, 'undefined', 0),
(28, 'undefined', 'R.30.045', '6m', 1, NULL, 0, 1, 33000, 0, 'undefined', 0),
(29, 'undefined', 'R.28.045', '6m', 1, NULL, 0, 1, 30000, 0, 'undefined', 0),
(30, 'undefined', 'Hollow galvalum 2 x 4 (0.30)', '4 m', 1, NULL, 0, 1, 18000, 0, 'undefined', 0),
(31, 'undefined', 'Hollow galvalum 4 x 4 (0.30)', '4 m', 1, NULL, 0, 1, 21500, 0, 'undefined', 0),
(32, 'undefined', 'Hollow galvalum 2 x 4 (0.35)', '4 m', 1, NULL, 0, 1, 20000, 0, 'undefined', 0),
(33, 'undefined', 'Hollow galvalum 4 x 4 (0.35)', '4 m', 1, NULL, 0, 1, 23500, 0, 'undefined', 0),
(34, 'undefined', 'Screw 12 x 20 (Truss)', '12 x 20', 1, NULL, 0, 2, 280, 0, 'undefined', 0),
(35, 'undefined', 'Screw 10 x 16 (Reng)', '10 x 16', 1, NULL, 0, 2, 150, 0, 'undefined', 0),
(36, 'undefined', 'Screw Roofing 7,5 cm', '7,5 cm', 1, NULL, 0, 2, 490, 0, 'undefined', 0),
(37, 'undefined', 'Screw Roofing 5 cm', '5 cm', 1, NULL, 0, 2, 370, 0, 'undefined', 0),
(38, 'undefined', 'Screw Roofing 2,5 cm', '2,5 cm', 1, NULL, 0, 2, 300, 0, 'undefined', 0),
(39, 'undefined', 'Screw Roofing  2 cm', ' 2 cm', 1, NULL, 0, 2, 250, 0, 'undefined', 0),
(40, 'undefined', 'Screw Gypsum 2 cm', '2 cm', 1, NULL, 0, 2, 100, 0, 'undefined', 0),
(41, 'undefined', 'Screw Gypsum 3 cm', '3 cm', 1, NULL, 0, 2, 120, 0, 'undefined', 0),
(42, 'undefined', 'Screw Gypsum 5 cm', '5 cm', 1, NULL, 0, 2, 175, 0, 'undefined', 0),
(43, 'undefined', 'Screw Roofing Kayu 3.8 cm', '3.8 cm', 1, NULL, 0, 2, 475, 0, 'undefined', 0),
(44, 'undefined', 'Screw Roofing Kayu 5 cm', '5 cm', 1, NULL, 0, 2, 600, 0, 'undefined', 0),
(45, 'undefined', 'Screw GRC 2,5 cm', '2,5 cm', 1, NULL, 0, 2, 80, 0, 'undefined', 0),
(46, 'undefined', 'Dynabolt 12 x 75', '12 x 75', 1, NULL, 0, 2, 2800, 0, 'undefined', 0),
(47, 'undefined', 'Dynabolt 10 x 65', '10 x 65', 1, NULL, 0, 2, 1800, 0, 'undefined', 0),
(48, 'undefined', 'Valley Gutter 0.35 (talang jurai)', 'undefined', 1, NULL, 0, 3, 42000, 0, 'undefined', 0),
(49, 'undefined', 'Strap Bracing', '0,1 x 3 x 3000 cm', 1, NULL, 0, 3, 8000, 0, 'undefined', 0),
(50, 'undefined', 'Braket L', 'undefined', 1, NULL, 0, 2, 9000, 0, 'undefined', 0),
(51, 'undefined', 'Braket U', 'undefined', 1, NULL, 0, 2, 5000, 0, 'undefined', 0),
(52, 'undefined', 'Mata bor screw', '6,5 cm', 1, NULL, 0, 2, 15000, 0, 'undefined', 0),
(53, 'undefined', 'Screw Truss PATA', '12 x 20', 1, NULL, 0, 2, 210, 0, 'undefined', 0),
(54, 'undefined', 'Screw Roofing  5 cm PATA', '5 cm', 1, NULL, 0, 2, 350, 0, 'undefined', 0),
(55, 'undefined', 'Screw Reng PATA', '10 x 16', 1, NULL, 0, 2, 180, 0, 'undefined', 0),
(56, 'undefined', 'Screw Truss Penfast ', '12 x 20', 1, NULL, 0, 2, 475, 0, 'undefined', 0),
(57, 'undefined', 'Screw Reng Penfast ', '10 x 16', 1, NULL, 0, 2, 375, 0, 'undefined', 0),
(58, 'undefined', 'PAKSA DECK A-750; 0.25E', '0,25mm e', 1, NULL, 0, 3, 0, 0, 'undefined', 0),
(59, 'undefined', 'PAKSA DECK A-750; 0.25', '0,25mm ', 1, NULL, 0, 3, 31000, 0, 'undefined', 0),
(60, 'undefined', 'PAKSA DECK A-750; 0.30', '0,30mm', 1, NULL, 0, 3, 36000, 0, 'undefined', 0),
(61, 'undefined', 'PAKSA DECK A-750; 0.35', '0,35mm', 1, NULL, 0, 3, 45000, 0, 'undefined', 0),
(62, 'undefined', 'PAKSA DECK A-750; 0.40', '0,40mm', 1, NULL, 0, 3, 50000, 0, 'undefined', 0),
(63, 'undefined', 'PAKSA DECK A-750; 0.45', '0,45mm', 1, NULL, 0, 3, 56000, 0, 'undefined', 0),
(64, 'undefined', 'PAKSA DECK A-750; 0.50', '0,50mm', 1, NULL, 0, 3, 0, 0, 'undefined', 0),
(65, 'undefined', 'PAKSA DECK BP750; 0.25', '0,25mm ', 1, NULL, 0, 3, 38500, 0, 'undefined', 0),
(66, 'undefined', 'PAKSA DECK BP750; 0.30', '0,30mm', 1, NULL, 0, 3, 44500, 0, 'undefined', 0),
(67, 'undefined', 'PAKSA DECK BP750; 0.35', '0,35mm', 1, NULL, 0, 3, 52000, 0, 'undefined', 0),
(68, 'undefined', 'PAKSA DECK BP750; 0.40', '0,40mm', 1, NULL, 0, 3, 59500, 0, 'undefined', 0),
(69, 'undefined', 'PAKSA DECK BP750; 0.45', '0,45mm', 1, NULL, 0, 3, 64000, 0, 'undefined', 0),
(70, 'undefined', 'PAKSA DECK BP750; 0.50', '0,50mm', 1, NULL, 0, 3, 71000, 0, 'undefined', 0),
(71, 'undefined', 'PAKSA DECK BP1000; 0.25', '0,25mm ', 1, NULL, 0, 3, 39000, 0, 'undefined', 0),
(72, 'undefined', 'PAKSA DECK BP1000; 0.30', '0,30mm', 1, NULL, 0, 3, 46000, 0, 'undefined', 0),
(73, 'undefined', 'PAKSA DECK BP1000; 0.35', '0,35mm', 1, NULL, 0, 3, 53000, 0, 'undefined', 0),
(74, 'undefined', 'PAKSA DECK BP1000; 0.40', '0,40mm', 1, NULL, 0, 3, 59000, 0, 'undefined', 0),
(75, 'undefined', 'PAKSA DECK BP1000; 0.45', '0,45mm', 1, NULL, 0, 3, 69500, 0, 'undefined', 0),
(76, 'undefined', 'PAKSA DECK BP1000; 0.50', '0,50mm', 1, NULL, 0, 3, 73500, 0, 'undefined', 0),
(77, 'undefined', 'Flatsheet 60 ; 0,25', 'undefined', 1, NULL, 0, 3, 30000, 0, 'undefined', 0),
(78, 'undefined', 'Flatsheet 60 ; 0,30', 'undefined', 1, NULL, 0, 3, 32000, 0, 'undefined', 0),
(79, 'undefined', 'Flatsheet 90 CM ; 0,25', 'undefined', 1, NULL, 0, 3, 31000, 0, 'undefined', 0),
(80, 'undefined', 'Flatsheet 90 CM ; 0,30', 'undefined', 1, NULL, 0, 3, 36000, 0, 'undefined', 0),
(81, 'undefined', 'Flatsheet 90 CM ; 0,35', 'undefined', 1, NULL, 0, 3, 48500, 0, 'undefined', 0),
(82, 'undefined', 'Flatsheet 90 CM ; 0,40', 'undefined', 1, NULL, 0, 3, 52500, 0, 'undefined', 0),
(83, 'undefined', 'Flatsheet 90 CM ; 0,45', 'undefined', 1, NULL, 0, 3, 61000, 0, 'undefined', 0),
(84, 'undefined', 'Flatsheet 90 CM ; 0,50', 'undefined', 1, NULL, 0, 3, 0, 0, 'undefined', 0),
(85, 'undefined', 'Flatsheet 120 CM ; 0,25', 'undefined', 1, NULL, 0, 3, 39000, 0, 'undefined', 0),
(86, 'undefined', 'Flatsheet 120 CM ; 0,30', 'undefined', 1, NULL, 0, 3, 46000, 0, 'undefined', 0),
(87, 'undefined', 'Flatsheet 120 CM ; 0,35', 'undefined', 1, NULL, 0, 3, 53000, 0, 'undefined', 0),
(88, 'undefined', 'Flatsheet 120 CM ; 0,40', 'undefined', 1, NULL, 0, 3, 59000, 0, 'undefined', 0),
(89, 'undefined', 'Flatsheet 120 CM ; 0,45', 'undefined', 1, NULL, 0, 3, 69500, 0, 'undefined', 0),
(90, 'undefined', 'Flatsheet 120 CM ; 0,50', 'undefined', 1, NULL, 0, 3, 73500, 0, 'undefined', 0),
(91, 'undefined', 'NOK 45 CM ; 0,25 MM', '2,5m', 1, NULL, 0, 3, 31000, 0, 'undefined', 0),
(92, 'undefined', 'NOK 45 CM ; 0,30 MM', '2,5m', 1, NULL, 0, 3, 34500, 0, 'undefined', 0),
(93, 'undefined', 'NOK 45 CM ; 0,35 MM', '2,5m', 1, NULL, 0, 3, 38000, 0, 'undefined', 0),
(94, 'undefined', 'NOK 45 CM ; 0,40 MM', '2,5m', 1, NULL, 0, 3, 41000, 0, 'undefined', 0),
(95, 'undefined', 'NOK 45 CM ; 0,45 MM', '2,5m', 1, NULL, 0, 3, 46000, 0, 'undefined', 0),
(96, 'undefined', 'NOK 45 CM ; 0,50 MM', '2,5m', 1, NULL, 0, 3, 48500, 0, 'undefined', 0),
(97, 'undefined', 'Skylight Fiber 1mm < 750mm', 'undefined', 1, NULL, 0, 3, 145000, 0, 'undefined', 0),
(98, 'undefined', 'Skylight Fiber 1mm > 750mm', 'undefined', 1, NULL, 0, 3, 165000, 0, 'undefined', 0),
(99, 'undefined', 'Skylight PVC 0,8mm ; 750mm', 'undefined', 1, NULL, 0, 4, 115000, 0, 'undefined', 0),
(100, 'undefined', 'MAXIFLOR 0,75 (960 mm)', 'undefined', 1, NULL, 0, 3, 165000, 0, 'undefined', 0),
(101, 'undefined', 'SUPERDEK 0,75 (1.000mm)', 'undefined', 1, NULL, 0, 3, 135000, 0, 'undefined', 0),
(102, 'undefined', 'BONDEX 0,75E HKP (1.000mm)', 'undefined', 1, NULL, 0, 3, 115000, 0, 'undefined', 0),
(103, 'undefined', 'BONDEX 0,65E HKP (1.000mm)', 'undefined', 1, NULL, 0, 3, 95000, 0, 'undefined', 0),
(104, 'undefined', 'Genteng Metal Pasir ; Merah', 'undefined', 1, NULL, 0, 5, 35000, 0, 'undefined', 0),
(105, 'undefined', 'Genteng Metal Pasir ; Coklat', 'undefined', 1, NULL, 0, 5, 35000, 0, 'undefined', 0),
(106, 'undefined', 'Nok Metal pasir ; Merah', 'undefined', 1, NULL, 0, 5, 33000, 0, 'undefined', 0),
(107, 'undefined', 'Nok Metal pasir ; Coklat', 'undefined', 1, NULL, 0, 5, 33000, 0, 'undefined', 0),
(108, 'undefined', 'AMARI ROOF UPVC', '770mm', 1, NULL, 0, 3, 130000, 0, 'undefined', 0),
(109, 'undefined', 'AMARI ROOF UPVC semi transparan', '770mm', 1, NULL, 0, 3, 130000, 0, 'undefined', 0),
(110, 'undefined', 'AMARI ROOF NOK KERPUS', '770mm', 1, NULL, 0, 5, 90000, 0, 'undefined', 0),
(111, 'undefined', 'ALDERON ROOF UPVC; PUTIH', '860mm', 1, NULL, 0, 3, 150000, 0, 'undefined', 0),
(112, 'undefined', 'ALDERON ROOF UPVC; TRANSPARAN', '860mm', 1, NULL, 0, 3, 190000, 0, 'undefined', 0),
(113, 'undefined', 'ALDERON NOK KERPUS UPVC', '860mm', 1, NULL, 0, 5, 135000, 0, 'undefined', 0),
(114, 'undefined', 'ALDERON KW (NON MERK)', '860mm', 1, NULL, 0, 3, 135000, 0, 'undefined', 0),
(115, 'undefined', 'SCREW + SEAL ALDERON', 'undefined', 1, NULL, 0, 2, 2500, 0, 'undefined', 0),
(116, 'undefined', 'Onduline', '200 x 95', 1, NULL, 0, 5, 150000, 0, 'undefined', 0),
(117, 'undefined', 'Onduvilla', '40 x 106', 1, NULL, 0, 5, 50000, 0, 'undefined', 0),
(118, 'undefined', 'Nok Atas Onduline - Onduvilla', '1m', 1, NULL, 0, 5, 85000, 0, 'undefined', 0),
(119, 'undefined', 'Nok Samping Onduline - Onduvilla', '1m', 1, NULL, 0, 5, 85000, 0, 'undefined', 0),
(120, 'undefined', 'Speedy Screw', 'undefined', 1, NULL, 0, 2, 1200, 0, 'undefined', 0),
(121, 'undefined', 'Harmonika BWG 16 (1.6mm) - 15x15', '15 X 15', 1, NULL, 0, 4, 78000, 0, 'undefined', 0),
(122, 'undefined', 'Harmonika BWG 16 (1.6mm) - 20x20', '20 x 20', 1, NULL, 0, 4, 75000, 0, 'undefined', 0),
(123, 'undefined', 'Harmonika BWG 16 (1.6mm) - 27x27', ' 27 x 27 ', 1, NULL, 0, 4, 50000, 0, 'undefined', 0),
(124, 'undefined', 'Harmonika BWG 16 (1.6mm) - 30x30', '30 x 30', 1, NULL, 0, 4, 42000, 0, 'undefined', 0),
(125, 'undefined', 'Harmonika BWG 16 (1.6mm) - 38x38', '38 x 38', 1, NULL, 0, 4, 39500, 0, 'undefined', 0),
(126, 'undefined', 'Harmonika BWG 16 (1.6mm) - 45x45', '45 x 45', 1, NULL, 0, 4, 32800, 0, 'undefined', 0),
(127, 'undefined', 'Harmonika BWG 16 (1.6mm) - 50x50', '50 x 50', 1, NULL, 0, 4, 31500, 0, 'undefined', 0),
(128, 'undefined', 'Harmonika BWG 16 (1.6mm) - 55x55', '55 x 55', 1, NULL, 0, 4, 30000, 0, 'undefined', 0),
(129, 'undefined', 'Harmonika BWG 16 (1.6mm) - 60x60', '60 x 60', 1, NULL, 0, 4, 29500, 0, 'undefined', 0),
(130, 'undefined', 'Harmonika BWG 14 (2.1mm) - 20x20', '20 x 20 ', 1, NULL, 0, 4, 79500, 0, 'undefined', 0),
(131, 'undefined', 'Harmonika BWG 14 (2.1mm) - 27x27', '27 x 27', 1, NULL, 0, 4, 64000, 0, 'undefined', 0),
(132, 'undefined', 'Harmonika BWG 14 (2.1mm) - 30x30', '30 x 30', 1, NULL, 0, 4, 50500, 0, 'undefined', 0),
(133, 'undefined', 'Harmonika BWG 14 (2.1mm) - 38x38', '38 x 38', 1, NULL, 0, 4, 46500, 0, 'undefined', 0),
(134, 'undefined', 'Harmonika BWG 14 (2.1mm) - 45x45', '45 x 45', 1, NULL, 0, 4, 42000, 0, 'undefined', 0),
(135, 'undefined', 'Harmonika BWG 14 (2.1mm) - 50x50', '50 x 50', 1, NULL, 0, 4, 39500, 0, 'undefined', 0),
(136, 'undefined', 'Harmonika BWG 14 (2.1mm) - 55x55', '55 x 55', 1, NULL, 0, 4, 38000, 0, 'undefined', 0),
(137, 'undefined', 'Harmonika BWG 14 (2.1mm) - 60x60', '60 x 60', 1, NULL, 0, 4, 36500, 0, 'undefined', 0),
(138, 'undefined', 'Harmonika BWG 12 (2.8mm) - 28x28', '28 x 28', 1, NULL, 0, 4, 89500, 0, 'undefined', 0),
(139, 'undefined', 'Harmonika BWG 12 (2.8mm) - 36x36', '36 x 36', 1, NULL, 0, 4, 85000, 0, 'undefined', 0),
(140, 'undefined', 'Harmonika BWG 12 (2.8mm) - 43x43', '43 x 43', 1, NULL, 0, 4, 64300, 0, 'undefined', 0),
(141, 'undefined', 'Harmonika BWG 12 (2.8mm) - 50x50', '50 x 50', 1, NULL, 0, 4, 62500, 0, 'undefined', 0),
(142, 'undefined', 'Harmonika BWG 12 (2.8mm) - 53x53', '53 x 53', 1, NULL, 0, 4, 60000, 0, 'undefined', 0),
(143, 'undefined', 'Harmonika BWG 12 (2.8mm) - 58x58', '58 x 58', 1, NULL, 0, 4, 57000, 0, 'undefined', 0),
(144, 'undefined', 'Harmonika BWG 11 (3.0mm) - 43x43', '43 x 43', 1, NULL, 0, 4, 74500, 0, 'undefined', 0),
(145, 'undefined', 'Harmonika BWG 11 (3.0mm) - 50x50', '50 x 50', 1, NULL, 0, 4, 66000, 0, 'undefined', 0),
(146, 'undefined', 'Harmonika BWG 11 (3.0mm) - 53x53', '53 x 53', 1, NULL, 0, 4, 62500, 0, 'undefined', 0),
(147, 'undefined', 'Harmonika BWG 11 (3.0mm) - 58x58', '58 x 58', 1, NULL, 0, 4, 60500, 0, 'undefined', 0),
(148, 'undefined', 'Harmonika BWG 10 (3.4mm) - 42x42', '42 x 42', 1, NULL, 0, 4, 88000, 0, 'undefined', 0),
(149, 'undefined', 'Harmonika BWG 10 (3.4mm) - 50x50', '50 x 50', 1, NULL, 0, 4, 83500, 0, 'undefined', 0),
(150, 'undefined', 'Harmonika BWG 10 (3.4mm) - 52x52', '52 x 52', 1, NULL, 0, 4, 79500, 0, 'undefined', 0),
(151, 'undefined', 'Harmonika BWG 10 (3.4mm) - 57x57', '57 x 57', 1, NULL, 0, 4, 75500, 0, 'undefined', 0),
(152, 'undefined', 'Harmonika BWG 8 (4.0mm) - 51x51', '51 x 51', 1, NULL, 0, 4, 110000, 0, 'undefined', 0),
(153, 'undefined', 'Harmonika BWG 8 (4.0mm) - 56x56', '56 x 56', 1, NULL, 0, 4, 102500, 0, 'undefined', 0),
(154, 'undefined', 'Harmonika BWG 6 (5.0mm) - 50x50', '50x50', 1, NULL, 0, 4, 0, 0, 'undefined', 0),
(155, 'undefined', 'Harmonika BWG 6 (5.0mm) - 55x55', '55x55', 1, NULL, 0, 4, 0, 0, 'undefined', 0),
(156, 'undefined', 'Harmonika PVC BWG 16 (1.6mm) - 25x25', '25x25', 1, NULL, 0, 4, 0, 0, 'undefined', 0),
(157, 'undefined', 'Harmonika PVC BWG 16 (1.6mm) - 28x28', '28 x 28', 1, NULL, 0, 4, 79000, 0, 'undefined', 0),
(158, 'undefined', 'Harmonika PVC BWG 16 (1.6mm) - 37x37', '37 x 37', 1, NULL, 0, 4, 62000, 0, 'undefined', 0),
(159, 'undefined', 'Harmonika PVC BWG 16 (1.6mm) - 43x43', '43 x 43', 1, NULL, 0, 4, 55500, 0, 'undefined', 0),
(160, 'undefined', 'Harmonika PVC BWG 16 (1.6mm) - 50x50', '50 x 50', 1, NULL, 0, 4, 53500, 0, 'undefined', 0),
(161, 'undefined', 'Harmonika PVC BWG 16 (1.6mm) - 53x53', '53 x 53', 1, NULL, 0, 4, 48000, 0, 'undefined', 0),
(162, 'undefined', 'Harmonika PVC BWG 16 (1.6mm) - 58x58', '58 x 58', 1, NULL, 0, 4, 47500, 0, 'undefined', 0),
(163, 'undefined', 'Harmonika PVC BWG 14 (2.1mm) - 36x36', '36 X 36', 1, NULL, 0, 4, 95000, 0, 'undefined', 0),
(164, 'undefined', 'Harmonika PVC BWG 14 (2.1mm) - 42x42', '42 x 42', 1, NULL, 0, 4, 80500, 0, 'undefined', 0),
(165, 'undefined', 'Harmonika PVC BWG 14 (2.1mm) - 50x50', '50 x 50', 1, NULL, 0, 4, 76500, 0, 'undefined', 0),
(166, 'undefined', 'Harmonika PVC BWG 14 (2.1mm) - 52x52', '52 x 52', 1, NULL, 0, 4, 71000, 0, 'undefined', 0),
(167, 'undefined', 'Harmonika PVC BWG 14 (2.1mm) - 57x57', '57 X 57', 1, NULL, 0, 4, 64000, 0, 'undefined', 0),
(168, 'undefined', 'Harmonika PVC BWG 12 (2.8mm) - 50x50', '50 X 50', 1, NULL, 0, 4, 108000, 0, 'undefined', 0),
(169, 'undefined', 'Harmonika PVC BWG 12 (2.8mm) - 55x55', '55 X 55', 1, NULL, 0, 4, 104000, 0, 'undefined', 0),
(170, 'undefined', 'Kawat Duri 4.5 Kg', '2.1 ; 2.7 ; 30m', 1, NULL, 0, 6, 110000, 0, 'undefined', 0),
(171, 'undefined', 'Kawat Duri 3.5 Kg', '2.1 ; 2.1 ; 25m', 1, NULL, 0, 6, 75000, 0, 'undefined', 0),
(172, 'undefined', 'Kawat Duri 7.5 Kg', '2.1 ; 2.1 ; 50m', 1, NULL, 0, 6, 135000, 0, 'undefined', 0),
(173, 'undefined', 'Kawat Duri PVC 7.5 Kg', '2.1 ; 2.1 ; 50m', 1, NULL, 0, 6, 425000, 0, 'undefined', 0),
(174, 'undefined', 'Kawat Silet BTO22', 'Ø 45cm ; 22mm ; 10m ', 1, NULL, 0, 6, 350000, 0, 'undefined', 0),
(175, 'undefined', 'Kawat Silet CBT65', 'Ø 45cm ; 65mm ; 10m ', 1, NULL, 0, 6, 450000, 0, 'undefined', 0),
(176, 'undefined', 'Kawat Bronjong 2.7 - 8x10', '2.7mm ; 3.4mm ; 2.0mm ; 2mx1mx0.5m', 1, NULL, 0, 7, 291000, 0, 'undefined', 0),
(177, 'undefined', 'Kawat Bronjong 2.7 - 10x12', '2.7mm ; 3.4mm ; 2.0mm ; 2mx1mx0.5m', 1, NULL, 0, 7, 271000, 0, 'undefined', 0),
(178, 'undefined', 'Kawat Bronjong 3.0 - 8x10', '3.0mm ; 4.0mm ; 2.0mm ; 2mx1mx0.5m', 1, NULL, 0, 7, 340000, 0, 'undefined', 0),
(179, 'undefined', 'Kawat Bronjong 3.0 - 10x12', '3.0mm ; 4.0mm ; 2.0mm ; 2mx1mx0.5m', 1, NULL, 0, 7, 315000, 0, 'undefined', 0),
(180, 'undefined', 'Kawat Bronjong 2.7 - 15x17', '2.7mm ; 3.4mm ; 2.0mm ; 2mx1mx0.5m', 1, NULL, 0, 7, 208000, 0, 'undefined', 0),
(181, 'undefined', 'Kawat Bronjong 2.7 - 18x20', '2.7mm ; 3.4mm ; 2.0mm ; 2mx1mx0.5m', 1, NULL, 0, 7, 182000, 0, 'undefined', 0),
(182, 'undefined', 'Kawat Bronjong 2.7 - 22x24', '2.7mm ; 3.4mm ; 2.0mm ; 2mx1mx0.5m', 1, NULL, 0, 7, 149000, 0, 'undefined', 0),
(183, 'undefined', 'Kawat Loket BWG 25 - 1/2\"x1/2\"', '3\' x 29\'', 1, NULL, 0, 6, 125000, 0, 'undefined', 0),
(184, 'undefined', 'Kawat Loket BWG 25 - 1/4\"x1/4\"', '3\' x 29\'', 1, NULL, 0, 6, 135000, 0, 'undefined', 0),
(185, 'undefined', 'Kawat Loket PVC BWG 25 - 1/2\"x1/2\"', '3\' x 29\' ; hijau', 1, NULL, 0, 6, 135000, 0, 'undefined', 0),
(186, 'undefined', 'Kawat Loket PVC BWG 25 - 1/4\"x1/4\"', '3\' x 29\' ; hijau', 1, NULL, 0, 6, 165000, 0, 'undefined', 0),
(187, 'undefined', 'Kawat Ayam - 1/2\"x1/2\"', '90cm x 500cm', 1, NULL, 0, 6, 130000, 0, 'undefined', 0),
(188, 'undefined', 'Glasswool 1625', '1.2m x 30m ; 2.5cm', 1, NULL, 0, 6, 450000, 0, 'undefined', 0),
(189, 'undefined', 'Glasswool 1650', '1.2m x 15m ; 5cm', 1, NULL, 0, 6, 450000, 0, 'undefined', 0),
(190, 'undefined', 'Glasswool 2425', '1.2m x 30m ; 2.5cm', 1, NULL, 0, 6, 690000, 0, 'undefined', 0),
(191, 'undefined', 'Glasswool 2450', '1.2m x 15m ; 5cm', 1, NULL, 0, 6, 690000, 0, 'undefined', 0),
(192, 'undefined', 'Glasswool 3625', '1.2m x 30m ; 2.5cm', 1, NULL, 0, 6, 920000, 0, 'undefined', 0),
(193, 'undefined', 'Glasswool 3650', '1.2m x 15m ; 5cm', 1, NULL, 0, 6, 920000, 0, 'undefined', 0),
(194, 'undefined', 'Glasswool HIJO / Glasswool Sintetis', '1m x 30m ; 2cm', 1, NULL, 0, 6, 1125000, 0, 'undefined', 0),
(195, 'undefined', 'ABR wool 4050', '60cm x 120cm ; 5cm', 1, NULL, 0, 8, 0, 0, 'undefined', 0),
(196, 'undefined', 'ABR wool 6025', '60cm x 120cm ; 2.5cm', 1, NULL, 0, 5, 36500, 0, 'undefined', 0),
(197, 'undefined', 'ABR wool 6050', '60cm x 120cm ; 5cm', 1, NULL, 0, 5, 65000, 0, 'undefined', 0),
(198, 'undefined', 'ABR wool 8025', '60cm x 120cm ; 2.5cm', 1, NULL, 0, 5, 44500, 0, 'undefined', 0),
(199, 'undefined', 'ABR wool 8050', '60cm x 120cm ; 5cm', 1, NULL, 0, 5, 82000, 0, 'undefined', 0),
(200, 'undefined', 'ABR wool 10025', '60cm x 120cm ; 2.5cm', 1, NULL, 0, 5, 47000, 0, 'undefined', 0),
(201, 'undefined', 'ABR wool 10050', '60cm x 120cm ; 5cm', 1, NULL, 0, 5, 91000, 0, 'undefined', 0),
(202, 'undefined', 'Rockwool 4050', '60cm x 120cm ; 5cm', 1, NULL, 0, 5, 47000, 0, 'undefined', 0),
(203, 'undefined', 'Rockwool 6050', '60cm x 120cm ; 5cm', 1, NULL, 0, 5, 62000, 0, 'undefined', 0),
(204, 'undefined', 'Rockwool 8050', '60cm x 120cm ; 5cm', 1, NULL, 0, 5, 75000, 0, 'undefined', 0),
(205, 'undefined', 'Rockwool 10050', '60cm x 120cm ; 5cm', 1, NULL, 0, 5, 85000, 0, 'undefined', 0),
(206, 'undefined', 'Firerock 4050', '60cm x 120cm ; 5cm', 1, NULL, 0, 5, 46000, 0, 'undefined', 0),
(207, 'undefined', 'Firerock 6050', '60cm x 120cm ; 5cm', 1, NULL, 0, 5, 62000, 0, 'undefined', 0),
(208, 'undefined', 'Firerock 8050', '60cm x 120cm ; 5cm', 1, NULL, 0, 5, 77000, 0, 'undefined', 0),
(209, 'undefined', 'Firerock 10050', '60cm x 120cm ; 5cm', 1, NULL, 0, 5, 0, 0, 'undefined', 0),
(210, 'undefined', 'Rockwool HIJO', '60cm x 120cm ; 5cm', 1, NULL, 0, 5, 80000, 0, 'undefined', 0),
(211, 'undefined', 'Roofmesh 3315', '1.8m x 30m ; 7.5cm x 7.5cm', 1, NULL, 0, 6, 500000, 0, 'undefined', 0),
(212, 'undefined', 'Roofmesh 2215', '1.2m x 30m ; 7.5cm x 7.5cm', 1, NULL, 0, 6, 900000, 0, 'undefined', 0),
(213, 'undefined', 'Roofmesh 2.1mm', '1.8m x 30m ; 15cm x 15cm', 1, NULL, 0, 6, 650000, 0, 'undefined', 0),
(214, 'undefined', 'Isolasi Aluminium A', '5cm x 41m', 1, NULL, 0, 6, 50000, 0, 'undefined', 0),
(215, 'undefined', 'Isolasi Aluminium B', '5cm x 36m', 1, NULL, 0, 6, 20000, 0, 'undefined', 0),
(216, 'undefined', 'Spindle Pin 35', '35mm ; 1000 pcs + 3 lem', 1, NULL, 0, 9, 868000, 0, 'undefined', 0),
(217, 'undefined', 'Spindle Pin 65', '65mm ; 1000 pcs + 3 lem', 1, NULL, 0, 9, 985000, 0, 'undefined', 0),
(218, 'undefined', 'Glass Cloth', '1.2m x 100m', 1, NULL, 0, 6, 1900000, 0, 'undefined', 0),
(219, 'undefined', 'Strip Plat Galvalume', '5cm x 60m', 1, NULL, 0, 6, 300000, 0, 'undefined', 0),
(220, 'undefined', 'Ceramic Wool 9625', '60cm x 720cm ; 2.5cm', 1, NULL, 0, 6, 550000, 0, 'undefined', 0),
(221, 'undefined', 'Ceramic Wool 9650', '60cm x 360cm ; 5cm', 1, NULL, 0, 6, 550000, 0, 'undefined', 0),
(222, 'undefined', 'Ceramic Wool 12825', '60cm x 720cm ; 2.5cm', 1, NULL, 0, 6, 650000, 0, 'undefined', 0),
(223, 'undefined', 'Ceramic Wool 12850', '60cm x 360cm ; 5cm', 1, NULL, 0, 6, 650000, 0, 'undefined', 0),
(224, 'undefined', 'Rockwool Pipa Ø 1/2\" - 25', 'undefined', 1, NULL, 0, 1, 32000, 0, 'undefined', 0),
(225, 'undefined', 'Rockwool Pipa Ø 3/4\" - 25', 'undefined', 1, NULL, 0, 1, 37000, 0, 'undefined', 0),
(226, 'undefined', 'Rockwool Pipa Ø 1\" - 25', 'undefined', 1, NULL, 0, 1, 41000, 0, 'undefined', 0),
(227, 'undefined', 'Rockwool Pipa Ø 1-1/4\" - 25', 'undefined', 1, NULL, 0, 1, 45000, 0, 'undefined', 0),
(228, 'undefined', 'Rockwool Pipa Ø 1-1/2\" - 25', 'undefined', 1, NULL, 0, 1, 47000, 0, 'undefined', 0),
(229, 'undefined', 'Rockwool Pipa Ø 2\" - 25', 'undefined', 1, NULL, 0, 1, 53000, 0, 'undefined', 0),
(230, 'undefined', 'Rockwool Pipa Ø 2-1/2\" - 25', 'undefined', 1, NULL, 0, 1, 64000, 0, 'undefined', 0),
(231, 'undefined', 'Rockwool Pipa Ø 3\" - 25', 'undefined', 1, NULL, 0, 1, 70000, 0, 'undefined', 0),
(232, 'undefined', 'Rockwool Pipa Ø 4\" - 25', 'undefined', 1, NULL, 0, 1, 86000, 0, 'undefined', 0),
(233, 'undefined', 'Rockwool Pipa Ø 5\" - 25', 'undefined', 1, NULL, 0, 1, 103000, 0, 'undefined', 0),
(234, 'undefined', 'Rockwool Pipa Ø 6\" - 25', 'undefined', 1, NULL, 0, 1, 119500, 0, 'undefined', 0),
(235, 'undefined', 'Rockwool Pipa Ø 8\" - 25', 'undefined', 1, NULL, 0, 1, 154000, 0, 'undefined', 0),
(236, 'undefined', 'Rockwool Pipa Ø 10\" - 25', 'undefined', 1, NULL, 0, 1, 185000, 0, 'undefined', 0),
(237, 'undefined', 'Rockwool Pipa Ø 12\" - 25', 'undefined', 1, NULL, 0, 1, 218000, 0, 'undefined', 0),
(238, 'undefined', 'Rockwool Pipa Ø 14\" - 25', 'undefined', 1, NULL, 0, 1, 238000, 0, 'undefined', 0),
(239, 'undefined', 'Rockwool Pipa Ø 16\" - 25', 'undefined', 1, NULL, 0, 1, 271000, 0, 'undefined', 0),
(240, 'undefined', 'Rockwool Pipa Ø 18\" - 25', 'undefined', 1, NULL, 0, 1, 330000, 0, 'undefined', 0),
(241, 'undefined', 'Rockwool Pipa Ø 20\" - 25', 'undefined', 1, NULL, 0, 1, 365000, 0, 'undefined', 0),
(242, 'undefined', 'Rockwool Pipa Ø 1/2\" - 50', 'undefined', 1, NULL, 0, 1, 81000, 0, 'undefined', 0),
(243, 'undefined', 'Rockwool Pipa Ø 3/4\" - 50', 'undefined', 1, NULL, 0, 1, 90500, 0, 'undefined', 0),
(244, 'undefined', 'Rockwool Pipa Ø 1\" - 50', 'undefined', 1, NULL, 0, 1, 99000, 0, 'undefined', 0),
(245, 'undefined', 'Rockwool Pipa Ø 1-1/4\" - 50', 'undefined', 1, NULL, 0, 1, 111000, 0, 'undefined', 0),
(246, 'undefined', 'Rockwool Pipa Ø 1-1/2\" - 50', 'undefined', 1, NULL, 0, 1, 121000, 0, 'undefined', 0),
(247, 'undefined', 'Rockwool Pipa Ø 2\" - 50', 'undefined', 1, NULL, 0, 1, 132000, 0, 'undefined', 0),
(248, 'undefined', 'Rockwool Pipa Ø 2-1/2\" - 50', 'undefined', 1, NULL, 0, 1, 135500, 0, 'undefined', 0),
(249, 'undefined', 'Rockwool Pipa Ø 3\" - 50', 'undefined', 1, NULL, 0, 1, 158500, 0, 'undefined', 0),
(250, 'undefined', 'Rockwool Pipa Ø 4\" - 50', 'undefined', 1, NULL, 0, 1, 191500, 0, 'undefined', 0),
(251, 'undefined', 'Rockwool Pipa Ø 5\" - 50', 'undefined', 1, NULL, 0, 1, 224500, 0, 'undefined', 0),
(252, 'undefined', 'Rockwool Pipa Ø 6\" - 50', 'undefined', 1, NULL, 0, 1, 255000, 0, 'undefined', 0),
(253, 'undefined', 'Rockwool Pipa Ø 8\" - 50', 'undefined', 1, NULL, 0, 1, 317000, 0, 'undefined', 0),
(254, 'undefined', 'Rockwool Pipa Ø 10\" - 50', 'undefined', 1, NULL, 0, 1, 376000, 0, 'undefined', 0),
(255, 'undefined', 'Rockwool Pipa Ø 12\" - 50', 'undefined', 1, NULL, 0, 1, 435000, 0, 'undefined', 0),
(256, 'undefined', 'Rockwool Pipa Ø 14\" - 50', 'undefined', 1, NULL, 0, 1, 462000, 0, 'undefined', 0),
(257, 'undefined', 'Rockwool Pipa Ø 16\" - 50', 'undefined', 1, NULL, 0, 1, 528000, 0, 'undefined', 0),
(258, 'undefined', 'Rockwool Pipa Ø 18\" - 50', 'undefined', 1, NULL, 0, 1, 673000, 0, 'undefined', 0),
(259, 'undefined', 'Rockwool Pipa Ø 20\" - 50', 'undefined', 1, NULL, 0, 1, 745000, 0, 'undefined', 0),
(260, 'undefined', 'Hilon Insulation DS', '1m x 20m ; 2cm', 1, NULL, 0, 6, 1600000, 0, 'undefined', 0),
(261, 'undefined', 'HIJO Insulation DS', '1m x 20m ; 2cm', 1, NULL, 0, 6, 1300000, 0, 'undefined', 0),
(262, 'undefined', 'AB Thermal Foil 4mm', '1.2m x 25m ; 4mm', 1, NULL, 0, 6, 1650000, 0, 'undefined', 0),
(263, 'undefined', 'AB Thermal Foil 8mm', '1.2m x 25m ; 8mm', 1, NULL, 0, 6, 1950000, 0, 'undefined', 0),
(264, 'undefined', 'SUPER BUBLE Foil D/S (Ultra A)', '1.2m x 25m', 1, NULL, 0, 6, 950000, 0, 'undefined', 0),
(265, 'undefined', 'AMI BUBLE Foil D/S (Ultra B)', '1m x 30m', 1, NULL, 0, 6, 800000, 0, 'undefined', 0),
(266, 'undefined', 'ULTRA FOIL BUBBLE D/S ', '1.2m x 25m', 1, NULL, 0, 6, 500000, 0, 'undefined', 0),
(267, 'undefined', 'XP FOIL S/S', '1.2m x 50m', 1, NULL, 0, 6, 350000, 0, 'undefined', 0),
(268, 'undefined', 'XP FOIL D/S', '1.2m x 50m', 1, NULL, 0, 6, 495000, 0, 'undefined', 0),
(269, 'undefined', 'MM Foil S/S (Ultra D)', '1.2m x 50m', 1, NULL, 0, 6, 350000, 0, 'undefined', 0),
(270, 'undefined', 'MM Foil D/S (Ultra D)', '1.2m x 50m', 1, NULL, 0, 6, 495000, 0, 'undefined', 0),
(271, 'undefined', 'AIRCELL Insulbreak 40F', '1.30m x 34.62m (45m) ; 4mm', 1, NULL, 0, 6, 0, 0, 'undefined', 0),
(272, 'undefined', 'AIRCELL Insulbreak 80F', '1.30m x 23.08m (30m) ; 8mm', 1, NULL, 0, 6, 0, 0, 'undefined', 0),
(273, 'undefined', 'AIRCELL RETROSHIELD', '1.35m x 22.25m (30m) ; 7mm', 1, NULL, 0, 6, 0, 0, 'undefined', 0),
(274, 'undefined', 'AIRCELL Insuliner 5.5', '1.35m x 22.25m (30m) ; 5,5mm', 1, NULL, 0, 6, 0, 0, 'undefined', 0),
(275, 'undefined', 'Kingspan Kooltherm K10FM', '2.27m x 1.20m (2.72m) ; 25mm', 1, NULL, 0, 6, 0, 0, 'undefined', 0),
(276, 'undefined', 'Tape Kingspan Air Cell WA 006', '72mm x 50m', 1, NULL, 0, 6, 0, 0, 'undefined', 0),
(277, 'undefined', 'Reinforce Insultape', '75mm x 50m', 1, NULL, 0, 6, 0, 0, 'undefined', 0),
(278, 'undefined', 'Papan Semen JAYABRIX 3.5mm', '1200 x 2400 (15 kg)', 1, NULL, 0, 5, 55440, 0, 'undefined', 0),
(279, 'undefined', 'Papan Semen JAYABRIX 4mm', '1200 x 2400 (17 kg)', 1, NULL, 0, 5, 76770, 0, 'undefined', 0),
(280, 'undefined', 'Papan Semen JAYABRIX 4.5mm', '1200 x 2400 (19 kg)', 1, NULL, 0, 5, 66100, 0, 'undefined', 0),
(281, 'undefined', 'Papan Semen JAYABRIX 6mm', '1200 x 2400 (26.5 kg)', 1, NULL, 0, 5, 110340, 0, 'undefined', 0),
(282, 'undefined', 'Papan Semen JAYABRIX 8mm', '1200 x 2400 (35.5 kg)', 1, NULL, 0, 5, 149490, 0, 'undefined', 0),
(283, 'undefined', 'Papan Semen NUSABOARD 3.5mm', '3,5', 1, NULL, 0, 5, 15500, 0, 'undefined', 0),
(284, 'undefined', 'Papan Semen NUSABOARD 4.5mm', '18,5', 1, NULL, 0, 5, 78500, 0, 'undefined', 0),
(285, 'undefined', 'Papan Semen NUSABOARD 6mm', '24,5', 1, NULL, 0, 5, 112000, 0, 'undefined', 0),
(286, 'undefined', 'Papan Semen NUSABOARD 8mm', '32', 1, NULL, 0, 5, 151000, 0, 'undefined', 0),
(287, 'undefined', 'Papan Semen NUSABOARD 9mm', '36', 1, NULL, 0, 5, 167500, 0, 'undefined', 0),
(288, 'undefined', 'Papan Semen NUSABOARD 10mm', '40', 1, NULL, 0, 5, 187000, 0, 'undefined', 0),
(289, 'undefined', 'Papan Semen NUSABOARD 12mm', '48', 1, NULL, 0, 5, 230000, 0, 'undefined', 0),
(290, 'undefined', 'Papan Semen NUSABOARD 20mm', '82', 1, NULL, 0, 5, 512000, 0, 'undefined', 0),
(291, 'undefined', 'NUSAPLANK PLAIN 2400 x 200 x 8', 'undefined', 1, NULL, 0, 5, 31000, 0, 'undefined', 0),
(292, 'undefined', 'NUSAPLANK PLAIN 2400 x 200 x 12', 'undefined', 1, NULL, 0, 5, 46000, 0, 'undefined', 0),
(293, 'undefined', 'NUSAPLANK PLAIN 2400 x 300 x 8', 'undefined', 1, NULL, 0, 5, 49000, 0, 'undefined', 0),
(294, 'undefined', 'NUSAPLANK PLAIN 2400 x 300 x 12', 'undefined', 1, NULL, 0, 5, 72500, 0, 'undefined', 0),
(295, 'undefined', 'NUSAPLANK PLAIN 4050 x 200 x 8', 'undefined', 1, NULL, 0, 5, 60000, 0, 'undefined', 0),
(296, 'undefined', 'NUSAPLANK PLAIN 4050 x 200 x 12', 'undefined', 1, NULL, 0, 5, 89000, 0, 'undefined', 0),
(297, 'undefined', 'NUSAPLANK PLAIN 4050 x 300 x 8', 'undefined', 1, NULL, 0, 5, 97000, 0, 'undefined', 0),
(298, 'undefined', 'NUSAPLANK PLAIN 4050 x 300 x 12', 'undefined', 1, NULL, 0, 5, 145000, 0, 'undefined', 0),
(299, 'undefined', 'NUSAPLANK WOOD 4050 x 200 x 8', 'undefined', 1, NULL, 0, 5, 60000, 0, 'undefined', 0),
(300, 'undefined', 'NUSAPLANK WOOD 4050 x 200 x 12', 'undefined', 1, NULL, 0, 5, 89000, 0, 'undefined', 0),
(301, 'undefined', 'NUSAPLANK WOOD 4050 x 300 x 8', 'undefined', 1, NULL, 0, 5, 97000, 0, 'undefined', 0),
(302, 'undefined', 'NUSAPLANK WOOD 4050 x 300 x 12', 'undefined', 1, NULL, 0, 5, 144000, 0, 'undefined', 0),
(303, 'undefined', 'GRC BOARD 4mm', '1220 x 2440 (16 Kg)', 1, NULL, 0, 5, 74375, 0, 'undefined', 0),
(304, 'undefined', 'GRC BOARD 5mm', '1220 x 2440 (24 Kg)', 1, NULL, 0, 5, 97500, 0, 'undefined', 0),
(305, 'undefined', 'GRC BOARD 6mm', '1220 x 2440 (28 Kg)', 1, NULL, 0, 5, 131250, 0, 'undefined', 0),
(306, 'undefined', 'GRC BOARD 8mm', '1220 x 2440 (38 Kg)', 1, NULL, 0, 5, 175000, 0, 'undefined', 0),
(307, 'undefined', 'GRC BOARD 10mm', '1220 x 2440 (46 Kg)', 1, NULL, 0, 5, 225000, 0, 'undefined', 0),
(308, 'undefined', 'CILUK BOARD 3.5mm', '1200 x 2400 (15 Kg)', 1, NULL, 0, 5, 51500, 0, 'undefined', 0),
(309, 'undefined', 'PINK BOARD 4 mm', '1200 x 2400 (16 Kg)', 1, NULL, 0, 5, 59500, 0, 'undefined', 0),
(310, 'undefined', 'GRC BOARD', 'undefined', 1, NULL, 0, 8, 0, 0, 'undefined', 0),
(311, 'undefined', 'Geotextile Non Woven GT-150-GR', '4m x 100m', 1, NULL, 0, 4, 6750, 0, 'undefined', 0),
(312, 'undefined', 'Geotextile Non Woven GT-200-GR', '4m x 100m', 1, NULL, 0, 4, 9000, 0, 'undefined', 0),
(313, 'undefined', 'Geotextile Non Woven GT-250-GR', '4m x 100m', 1, NULL, 0, 4, 11250, 0, 'undefined', 0),
(314, 'undefined', 'Geotextile Non Woven GT-300-GR', '4m x 100m', 1, NULL, 0, 4, 13500, 0, 'undefined', 0),
(315, 'undefined', 'Geotextile Non Woven GT-350-GR', '4m x 100m', 1, NULL, 0, 4, 15750, 0, 'undefined', 0),
(316, 'undefined', 'Geotextile Non Woven GT-400-GR', '4m x 100m', 1, NULL, 0, 4, 18000, 0, 'undefined', 0),
(317, 'undefined', 'Geotextile Non Woven GT-450-GR', '4m x 100m', 1, NULL, 0, 4, 20250, 0, 'undefined', 0),
(318, 'undefined', 'Geotextile Non Woven GT-500-GR', '4m x 100m', 1, NULL, 0, 4, 22500, 0, 'undefined', 0),
(319, 'undefined', 'Geotextile Non Woven GT-550-GR', '4m x 100m', 1, NULL, 0, 4, 24750, 0, 'undefined', 0),
(320, 'undefined', 'Geotextile Non Woven GT-600-GR', '4m x 100m', 1, NULL, 0, 4, 27000, 0, 'undefined', 0),
(321, 'undefined', 'Geotextile Non Woven GT-650-GR', '4m x 100m', 1, NULL, 0, 4, 29250, 0, 'undefined', 0),
(322, 'undefined', 'Geotextile Non Woven GT-700-GR', '4m x 100m', 1, NULL, 0, 4, 33750, 0, 'undefined', 0),
(323, 'undefined', 'Geotextile Woven GT-150-GR', '4m x 100m', 1, NULL, 0, 4, 7500, 0, 'undefined', 0),
(324, 'undefined', 'Geotextile Woven GT-200-GR', '4m x 100m', 1, NULL, 0, 4, 10000, 0, 'undefined', 0),
(325, 'undefined', 'Geotextile Woven GT-250-GR', '4m x 100m', 1, NULL, 0, 4, 12500, 0, 'undefined', 0),
(326, 'undefined', 'Geotextile Woven GT-300-GR', '4m x 100m', 1, NULL, 0, 4, 15000, 0, 'undefined', 0),
(327, 'undefined', 'Geotextile Woven GT-350-GR', '4m x 100m', 1, NULL, 0, 4, 17500, 0, 'undefined', 0),
(328, 'undefined', 'Geotextile Woven GT-400-GR', '4m x 100m', 1, NULL, 0, 4, 20000, 0, 'undefined', 0),
(329, 'undefined', 'Geotextile Woven GT-450-GR', '4m x 100m', 1, NULL, 0, 4, 22500, 0, 'undefined', 0),
(330, 'undefined', 'Geotextile Woven GT-500-GR', '4m x 100m', 1, NULL, 0, 4, 25000, 0, 'undefined', 0),
(331, 'undefined', 'Geotextile Woven GT-550-GR', '4m x 100m', 1, NULL, 0, 4, 27500, 0, 'undefined', 0),
(332, 'undefined', 'Geotextile Woven GT-600-GR', '4m x 100m', 1, NULL, 0, 4, 30000, 0, 'undefined', 0),
(333, 'undefined', 'Geotextile Woven GT-650-GR', '4m x 100m', 1, NULL, 0, 4, 32500, 0, 'undefined', 0),
(334, 'undefined', 'Geotextile Woven GT-700-GR', '4m x 100m', 1, NULL, 0, 4, 35000, 0, 'undefined', 0),
(335, 'undefined', 'Geomembrane GM-300-HDPE', '0.3mm ; 6m x 100 m', 1, NULL, 0, 4, 15500, 0, 'undefined', 0),
(336, 'undefined', 'Geomembrane GM-500-HDPE', '0.5mm ; 6m x 100 m', 1, NULL, 0, 4, 22200, 0, 'undefined', 0),
(337, 'undefined', 'Geomembrane GM-750-HDPE', '0.75mm ; 7m x 280 m', 1, NULL, 0, 4, 31000, 0, 'undefined', 0),
(338, 'undefined', 'Geomembrane GM-1000-HDPE', '1mm ; 7m x 210 m', 1, NULL, 0, 4, 40000, 0, 'undefined', 0),
(339, 'undefined', 'Geomembrane GM-1500-HDPE', '1.5mm ; 7m x 140 m', 1, NULL, 0, 4, 58000, 0, 'undefined', 0),
(340, 'undefined', 'Geomembrane GM-2000-HDPE', '2mm ; 7m x 105 m', 1, NULL, 0, 4, 76000, 0, 'undefined', 0),
(341, 'undefined', 'Geomembrane GM-2500-HDPE', '2.5mm ; 7m x 84 m', 1, NULL, 0, 4, 94000, 0, 'undefined', 0),
(342, 'undefined', 'Geomembrane GM-3000-HDPE', '3mm ; 7m x 70 m', 1, NULL, 0, 4, 111500, 0, 'undefined', 0),
(343, 'undefined', 'Geomembrane GM-0.3mm-LDPE', '0.3mm ; 4m x 50m', 1, NULL, 0, 4, 26000, 0, 'undefined', 0),
(344, 'undefined', 'Geomembrane GM-0.3mm-HDPE (4m x 100m)', '0.3mm ; 4m x 100m', 1, NULL, 0, 4, 25500, 0, 'undefined', 0),
(345, 'undefined', 'Geomembrane GM-0.5mm-LDPE', '0.5mm ; 4m x 50m', 1, NULL, 0, 4, 34000, 0, 'undefined', 0),
(346, 'undefined', 'Geomembrane GM-0.5mm-HDPE (4m x 50m)', '0.5mm ; 4m x 50m', 1, NULL, 0, 4, 33500, 0, 'undefined', 0),
(347, 'undefined', 'Geo Bag GB-(8cm x 120cm)', 'undefined', 1, NULL, 0, 8, 910000, 0, 'undefined', 0),
(348, 'undefined', 'Geo Bag 60 x 40 cm', 'undefined', 1, NULL, 0, 8, 401000, 0, 'undefined', 0),
(349, 'undefined', 'Geo Bag 80 x 50 cm', 'undefined', 1, NULL, 0, 8, 339000, 0, 'undefined', 0),
(350, 'undefined', 'Geo Bag 100 x 60 cm', 'undefined', 1, NULL, 0, 8, 515000, 0, 'undefined', 0),
(351, 'undefined', 'Geo Bag 120 x 80 cm', 'undefined', 1, NULL, 0, 8, 770000, 0, 'undefined', 0),
(352, 'undefined', 'Geo Cell 75', '500cm x 450cm x 7,5cm', 1, NULL, 0, 5, 65000, 0, 'undefined', 0),
(353, 'undefined', 'Geo Cell 100', '500cm x 450cm x 10cm', 1, NULL, 0, 5, 75000, 0, 'undefined', 0),
(354, 'undefined', 'Geo Cell 150', '500cm x 450cm x 15cm', 1, NULL, 0, 5, 95000, 0, 'undefined', 0),
(355, 'undefined', 'Geo Grid Biaxial 30x30', '3.95m x 50m', 1, NULL, 0, 6, 43000, 0, 'undefined', 0),
(356, 'undefined', 'Geo Grid Biaxial 40x40', '3.95m x 50m', 1, NULL, 0, 6, 48500, 0, 'undefined', 0),
(357, 'undefined', 'Geo Grid Triaxial', '3.95m x 50m', 1, NULL, 0, 6, 55000, 0, 'undefined', 0),
(358, 'undefined', 'Composite Grid CG30', '3.95m x 50m', 1, NULL, 0, 6, 51000, 0, 'undefined', 0),
(359, 'undefined', 'Composite Grid CG40', '3.95m x 50m', 1, NULL, 0, 6, 62000, 0, 'undefined', 0),
(360, 'undefined', 'Drainage Cell', '50cm x 50cm x 3cm', 1, NULL, 0, 5, 49500, 0, 'undefined', 0),
(361, 'undefined', 'Geo Pipe SW 4\"', '50m/ roll', 1, NULL, 0, 3, 63500, 0, 'undefined', 0),
(362, 'undefined', 'Geo Pipe SW 6\"', '30m/ roll', 1, NULL, 0, 3, 131500, 0, 'undefined', 0),
(363, 'undefined', 'Geo Pipe SW 8\"', '30m/ roll', 1, NULL, 0, 3, 212500, 0, 'undefined', 0),
(364, 'undefined', 'Geo Pipe DW 4\"', '50m/ roll', 1, NULL, 0, 3, 83000, 0, 'undefined', 0),
(365, 'undefined', 'Geo Pipe DW 6\"', '30m/ roll', 1, NULL, 0, 3, 186500, 0, 'undefined', 0),
(366, 'undefined', 'Geo Pipe DW 8\"', '30m/ roll', 1, NULL, 0, 3, 313000, 0, 'undefined', 0),
(367, 'undefined', 'ACP SEVEN P.E 1.22x2.44', '1.22m x 2.44m ; 0,21', 1, NULL, 0, 5, 503000, 0, 'undefined', 0),
(368, 'undefined', 'ACP SEVEN P.E 1.22x4.88', '1.22m x 4.88m ; 0,21', 1, NULL, 0, 5, 1006000, 0, 'undefined', 0),
(369, 'undefined', 'ACP SEVEN PVDF DOFF 1.22x2.44', '1.22m x 2.44m ; 0,3', 1, NULL, 0, 5, 742000, 0, 'undefined', 0),
(370, 'undefined', 'ACP SEVEN PVDF DOFF 1.22x4.88', '1.22m x 4.88m ; 0,3', 1, NULL, 0, 5, 1484000, 0, 'undefined', 0),
(371, 'undefined', 'ACP SEVEN PVDF GLOSSY 1.22x2.44', '1.22m x 2.44m ; 0,3', 1, NULL, 0, 5, 758000, 0, 'undefined', 0),
(372, 'undefined', 'ACP SEVEN PVDF GLOSSY 1.22x4.88', '1.22m x 4.88m ; 0,3', 1, NULL, 0, 5, 1516000, 0, 'undefined', 0),
(373, 'undefined', 'ACP SEVEN PVDF METALIC 1.22x2.44', '1.22m x 2.44m ; 0,3', 1, NULL, 0, 5, 771000, 0, 'undefined', 0),
(374, 'undefined', 'ACP SEVEN PVDF METALIC 1.22x4.88', '1.22m x 4.88m ; 0,3', 1, NULL, 0, 5, 1542000, 0, 'undefined', 0),
(375, 'undefined', 'ACP SEVEN PVDF SPARKLING 1.22x2.44', '1.22m x 2.44m ; 0,3', 1, NULL, 0, 5, 781000, 0, 'undefined', 0),
(376, 'undefined', 'ACP SEVEN PVDF SPARKLING 1.22x4.88', '1.22m x 4.88m ; 0,3', 1, NULL, 0, 5, 1562000, 0, 'undefined', 0),
(377, 'undefined', 'ACP SEVEN PVDF WOODEN 1.22x2.44', '1.22m x 2.44m ; 0,3', 1, NULL, 0, 5, 985000, 0, 'undefined', 0),
(378, 'undefined', 'ACP SEVEN PVDF WOODEN 1.22x4.88', '1.22m x 4.88m ; 0,3', 1, NULL, 0, 5, 1970000, 0, 'undefined', 0),
(379, 'undefined', 'Cyclone Ø24\" AL', 'Ø24\" (60cm) Aluminium', 1, NULL, 0, 7, 950000, 0, 'undefined', 0),
(380, 'undefined', 'Cyclone Ø24\" SS', 'Ø24\" (60cm) Stainless Steel', 1, NULL, 0, 7, 1580000, 0, 'undefined', 0),
(381, 'undefined', 'Cyclone Ø30\" AL', 'Ø30\" (75cm) Aluminium', 1, NULL, 0, 7, 1675000, 0, 'undefined', 0),
(382, 'undefined', 'Cyclone Ø30\" SS', 'Ø30\" (75cm) Stainless Steel', 1, NULL, 0, 7, 2280000, 0, 'undefined', 0),
(383, 'undefined', 'Cyclone Ø36\" AL', 'Ø36\" (90cm) Aluminium', 1, NULL, 0, 7, 2150000, 0, 'undefined', 0),
(384, 'undefined', 'Cyclone Ø36\" SS', 'Ø36\" (90cm) Stainless Steel', 1, NULL, 0, 7, 2730000, 0, 'undefined', 0),
(385, 'undefined', 'AURACAST 308 (1000L)', '1000', 1, NULL, 0, 8, 68498100, 0, 'undefined', 0),
(386, 'undefined', 'AURACAST 308 (210L)', '210', 1, NULL, 0, 8, 14927000, 0, 'undefined', 0),
(387, 'undefined', 'AURAMIX 211 (1000L)', '1000', 1, NULL, 0, 8, 40163200, 0, 'undefined', 0),
(388, 'undefined', 'CEBEX 100 (20 KG)', '20', 1, NULL, 0, 8, 1317800, 0, 'undefined', 0),
(389, 'undefined', 'CONPLAST CWP (210L)', '210', 1, NULL, 0, 8, 13568500, 0, 'undefined', 0),
(390, 'undefined', 'CONPLAST F292M8 (200L)', '200', 1, NULL, 0, 8, 8316000, 0, 'undefined', 0),
(391, 'undefined', 'CONPLAST F292M8 (20L)', '20', 1, NULL, 0, 8, 924000, 0, 'undefined', 0),
(392, 'undefined', 'CONPLAST P211 (20L)', '20', 1, NULL, 0, 8, 574200, 0, 'undefined', 0),
(393, 'undefined', 'CONPLAST P211 (210L)', '210', 1, NULL, 0, 8, 4552900, 0, 'undefined', 0),
(394, 'undefined', 'CONPLAST R (1000L)', '1000', 1, NULL, 0, 8, 9971500, 0, 'undefined', 0),
(395, 'undefined', 'CONPLAST R (20L)', '20', 1, NULL, 0, 8, 596200, 0, 'undefined', 0),
(396, 'undefined', 'CONPLAST R (210L)', '210', 1, NULL, 0, 8, 4006200, 0, 'undefined', 0),
(397, 'undefined', 'CONPLAST R2 (1000L)', '1000', 1, NULL, 0, 8, 26400000, 0, 'undefined', 0),
(398, 'undefined', 'CONPLAST R2 (20L)', '20', 1, NULL, 0, 8, 619300, 0, 'undefined', 0),
(399, 'undefined', 'CONPLAST R2 (210L)', '210', 1, NULL, 0, 8, 5123800, 0, 'undefined', 0),
(400, 'undefined', 'CONPLAST RP1000 (1000L)', '1000', 1, NULL, 0, 8, 20013400, 0, 'undefined', 0),
(401, 'undefined', 'CONPLAST RP264 (1000L)', '1000', 1, NULL, 0, 8, 25110800, 0, 'undefined', 0),
(402, 'undefined', 'CONPLAST RP264 (210L)', '210', 1, NULL, 0, 8, 5887200, 0, 'undefined', 0),
(403, 'undefined', 'CONPLAST RP264M2 (1000L)', '1000', 1, NULL, 0, 8, 7847400, 0, 'undefined', 0),
(404, 'undefined', 'CONPLAST RP264M2 (20L)', '20', 1, NULL, 0, 8, 485100, 0, 'undefined', 0),
(405, 'undefined', 'CONPLAST RP264M2 (210L)', '210', 1, NULL, 0, 8, 3698200, 0, 'undefined', 0),
(406, 'undefined', 'CONPLAST RP264M3 (1000L)', '1000', 1, NULL, 0, 8, 11550000, 0, 'undefined', 0),
(407, 'undefined', 'CONPLAST RP264M3 (20L)', '20', 1, NULL, 0, 8, 420200, 0, 'undefined', 0),
(408, 'undefined', 'CONPLAST RP264M3 (210L)', '210', 1, NULL, 0, 8, 3390200, 0, 'undefined', 0),
(409, 'undefined', 'CONPLAST SP337 (1000L)', '1000', 1, NULL, 0, 8, 30077300, 0, 'undefined', 0),
(410, 'undefined', 'CONPLAST SP337 (20L)', '20', 1, NULL, 0, 8, 756000, 0, 'undefined', 0),
(411, 'undefined', 'CONPLAST SP337 (210L)', '210', 1, NULL, 0, 8, 7280900, 0, 'undefined', 0),
(412, 'undefined', 'CONPLAST SP420 (1000L)', '1000', 1, NULL, 0, 8, 33158400, 0, 'undefined', 0),
(413, 'undefined', 'CONPLAST SP420 (20L)', '20', 1, NULL, 0, 8, 721600, 0, 'undefined', 0),
(414, 'undefined', 'CONPLAST SP420 (210L)', '210', 1, NULL, 0, 8, 7682400, 0, 'undefined', 0),
(415, 'undefined', 'CONPLAST SP430 (1000L)', '1000', 1, NULL, 0, 8, 25647600, 0, 'undefined', 0),
(416, 'undefined', 'CONPLAST SP430 (20L)', '20', 1, NULL, 0, 8, 920700, 0, 'undefined', 0),
(417, 'undefined', 'CONPLAST SP430 (210L)', '210', 1, NULL, 0, 8, 8298400, 0, 'undefined', 0),
(418, 'undefined', 'CONPLAST SP430D (1000L)', '1000', 1, NULL, 0, 8, 24033900, 0, 'undefined', 0),
(419, 'undefined', 'CONPLAST SP430D (20L)', '20', 1, NULL, 0, 8, 908600, 0, 'undefined', 0),
(420, 'undefined', 'CONPLAST SP430D (210L)', '210', 1, NULL, 0, 8, 8235700, 0, 'undefined', 0),
(421, 'undefined', 'CONPLAST SPRAYSET POWDER (12.5kg)', '12.5', 1, NULL, 0, 8, 418000, 0, 'undefined', 0),
(422, 'undefined', 'CONPLAST SPRAYSET SL (20L)', '20', 1, NULL, 0, 8, 646800, 0, 'undefined', 0),
(423, 'undefined', 'CONPLAST SPRAYSET SL (210L)', '210', 1, NULL, 0, 8, 5286600, 0, 'undefined', 0),
(424, 'undefined', 'CONPLAST UW (12.5kg)', '12.5', 1, NULL, 0, 8, 5871800, 0, 'undefined', 0),
(425, 'undefined', 'CONPLAST WP400 (210L)', '210', 1, NULL, 0, 8, 10084800, 0, 'undefined', 0),
(426, 'undefined', 'CONPLAST WP421 (20L)', '20', 1, NULL, 0, 8, 873400, 0, 'undefined', 0),
(427, 'undefined', 'CONPLAST WP421 (210L)', '210', 1, NULL, 0, 8, 5309700, 0, 'undefined', 0),
(428, 'undefined', 'CONPLAST X421M (20L)', '20', 1, NULL, 0, 8, 1894200, 0, 'undefined', 0),
(429, 'undefined', 'CONPLAST X421M (210L)', '210', 1, NULL, 0, 8, 17073100, 0, 'undefined', 0),
(430, 'undefined', 'FOSROC PPF M12 (0.6kg)', '0.6', 1, NULL, 0, 8, 204600, 0, 'undefined', 0),
(431, 'undefined', 'FOSROC PPF M12 (0.9kg)', '0.9', 1, NULL, 0, 8, 258500, 0, 'undefined', 0),
(432, 'undefined', 'QUICKSOCRETE HP (20L)', '20', 1, NULL, 0, 8, 675400, 0, 'undefined', 0),
(433, 'undefined', 'QUICKSOCRETE HP (210L)', '210', 1, NULL, 0, 8, 5286600, 0, 'undefined', 0),
(434, 'undefined', 'SPRAYSET HBL (250kg)', '250', 1, NULL, 0, 8, 27300900, 0, 'undefined', 0),
(435, 'undefined', 'STRUCTURO 305 (210L)', '210', 1, NULL, 0, 8, 5384500, 0, 'undefined', 0),
(436, 'undefined', 'STRUCTURO 335 (1000L)', '1000', 1, NULL, 0, 8, 66452100, 0, 'undefined', 0),
(437, 'undefined', 'STRUCTURO 335 (20L)', '20', 1, NULL, 0, 8, 3276900, 0, 'undefined', 0),
(438, 'undefined', 'STRUCTURO 335 (210L)', '210', 1, NULL, 0, 8, 32905400, 0, 'undefined', 0),
(439, 'undefined', 'STRUCTURO PD203 (1000L)', '1000', 1, NULL, 0, 8, 76292700, 0, 'undefined', 0),
(440, 'undefined', 'STRUCTURO PD203 (20L)', '20', 1, NULL, 0, 8, 1709400, 0, 'undefined', 0),
(441, 'undefined', 'STRUCTURO PD203 (210L)', '210', 1, NULL, 0, 8, 8605300, 0, 'undefined', 0),
(442, 'undefined', 'CONCURE 75 CLEAR (20L)', '20', 1, NULL, 0, 8, 2300100, 0, 'undefined', 0),
(443, 'undefined', 'CONCURE 75 CLEAR (210L)', '210', 1, NULL, 0, 8, 21013300, 0, 'undefined', 0),
(444, 'undefined', 'CONCURE P (20L)', '20', 1, NULL, 0, 8, 442200, 0, 'undefined', 0),
(445, 'undefined', 'CONCURE P (210L)', '210', 1, NULL, 0, 8, 3489200, 0, 'undefined', 0),
(446, 'undefined', 'CONCURE PI (20L)', '20', 1, NULL, 0, 8, 366300, 0, 'undefined', 0),
(447, 'undefined', 'CONCURE PI (210L)', '210', 1, NULL, 0, 8, 2426600, 0, 'undefined', 0),
(448, 'undefined', 'NITOFLOR CURESEAL (20L)', '20', 1, NULL, 0, 8, 3511200, 0, 'undefined', 0),
(449, 'undefined', 'PRECO HYDROTARD LILAC (20L)', '20', 1, NULL, 0, 8, 1398100, 0, 'undefined', 0),
(450, 'undefined', 'PRECO HYDROTARD LILAC (210L)', '210', 1, NULL, 0, 8, 12545500, 0, 'undefined', 0),
(451, 'undefined', 'REEBOL (20L)', '20', 1, NULL, 0, 8, 1399200, 0, 'undefined', 0),
(452, 'undefined', 'REEBOL (210L)', '210', 1, NULL, 0, 8, 11063800, 0, 'undefined', 0),
(453, 'undefined', 'REEBOL EMULSION (20L)', '20', 1, NULL, 0, 8, 2646600, 0, 'undefined', 0),
(454, 'undefined', 'REEBOL EMULSION (210L)', '210', 1, NULL, 0, 8, 24649900, 0, 'undefined', 0),
(455, 'undefined', 'REEBOL EMULSION CONCENTRATE (20L)', '20', 1, NULL, 0, 8, 2912800, 0, 'undefined', 0),
(456, 'undefined', 'REEBOL EMULSION CONCENTRATE (210L)', '210', 1, NULL, 0, 8, 27370200, 0, 'undefined', 0),
(457, 'undefined', 'NITOMORTAR S (28.3KG)', '28.3', 1, NULL, 0, 8, 1889800, 0, 'undefined', 0),
(458, 'undefined', 'NITOMORTAR UA (6L)', '6', 1, NULL, 0, 8, 2021800, 0, 'undefined', 0),
(459, 'undefined', 'PATCHROC F50 (30kg)', '30', 1, NULL, 0, 8, 1018600, 0, 'undefined', 0),
(460, 'undefined', 'PATCHROC RSP (30kg)', '30', 1, NULL, 0, 8, 436700, 0, 'undefined', 0),
(461, 'undefined', 'PATCHROC RSP100 (30kg)', '30', 1, NULL, 0, 8, 465300, 0, 'undefined', 0),
(462, 'undefined', 'PLASTER FINISH (25KG)', '25', 1, NULL, 0, 8, 187000, 0, 'undefined', 0),
(463, 'undefined', 'PLASTEROC MPR (25KG)', '25', 1, NULL, 0, 8, 169400, 0, 'undefined', 0),
(464, 'undefined', 'RENDEROC FC (25kg)', '25', 1, NULL, 0, 8, 414700, 0, 'undefined', 0),
(465, 'undefined', 'RENDEROC HB40 (25kg)', '25', 1, NULL, 0, 8, 513700, 0, 'undefined', 0),
(466, 'undefined', 'RENDEROC HF (25kg)', '25', 1, NULL, 0, 8, 299200, 0, 'undefined', 0),
(467, 'undefined', 'RENDEROC HF PREMIX (30kg)', '30', 1, NULL, 0, 8, 382800, 0, 'undefined', 0),
(468, 'undefined', 'RENDEROC PLUG (25kg)', '25', 1, NULL, 0, 8, 833800, 0, 'undefined', 0),
(469, 'undefined', 'RENDEROC RG (25kg)', '25', 1, NULL, 0, 8, 202400, 0, 'undefined', 0),
(470, 'undefined', 'RENDEROC RG PREMIX (30kg)', '30', 1, NULL, 0, 8, 305800, 0, 'undefined', 0),
(471, 'undefined', 'RENDEROC S (25kg)', '25', 1, NULL, 0, 8, 240900, 0, 'undefined', 0),
(472, 'undefined', 'RENDEROC SM (25kg)', '25', 1, NULL, 0, 8, 211200, 0, 'undefined', 0),
(473, 'undefined', 'RENDEROC SM GREEN (25kg)', '25', 1, NULL, 0, 8, 328900, 0, 'undefined', 0),
(474, 'undefined', 'RENDEROC TG (25kg)', '25', 1, NULL, 0, 8, 579700, 0, 'undefined', 0),
(475, 'undefined', 'LOKFIX E75', 'undefined', 1, NULL, 0, 8, 870100, 0, 'undefined', 0),
(476, 'undefined', 'NITOFLOR DPM OXIDE RED (10kg)', '10', 1, NULL, 0, 8, 2659800, 0, 'undefined', 0),
(477, 'undefined', 'NITOFLOR FC140 GRASS GREEN  (5kg)', '5', 1, NULL, 0, 8, 1448700, 0, 'undefined', 0),
(478, 'undefined', 'NITOFLOR FC140 LIGHT GREY  (5kg)', '5', 1, NULL, 0, 8, 1382700, 0, 'undefined', 0),
(479, 'undefined', 'NITOFLOR FC140 MISTY GREY (5kg)', '5', 1, NULL, 0, 8, 1461900, 0, 'undefined', 0),
(480, 'undefined', 'NITOFLOR FC150 GRASS GREEN 161 (4.5L)', '4.5', 1, NULL, 0, 8, 1465200, 0, 'undefined', 0),
(481, 'undefined', 'NITOFLOR FC150 LIGHT GREY (4.5L)', '4.5', 1, NULL, 0, 8, 1375000, 0, 'undefined', 0),
(482, 'undefined', 'NITOFLOR FC150 LIGHT GREY RAL7035 (4.8L)', '4.8', 1, NULL, 0, 8, 3077800, 0, 'undefined', 0),
(483, 'undefined', 'NITOFLOR FC150 LIGHT IVORY  (4.5L)', '4.5', 1, NULL, 0, 8, 1389300, 0, 'undefined', 0),
(484, 'undefined', 'NITOFLOR FC150 MISTY GREY (4.5L)', '4.5', 1, NULL, 0, 8, 1464100, 0, 'undefined', 0),
(485, 'undefined', 'NITOFLOR FC150 PEBBLE GREY RAL7032 (4.5L)', '4.5', 1, NULL, 0, 8, 1311200, 0, 'undefined', 0),
(486, 'undefined', 'NITOFLOR FC150 SIGNAL BLUE (4.5L)', '4.5', 1, NULL, 0, 8, 1370600, 0, 'undefined', 0),
(487, 'undefined', 'NITOFLOR FC150 SUNSHINE YELLOW (4.5L)', '4.5', 1, NULL, 0, 8, 1463000, 0, 'undefined', 0),
(488, 'undefined', 'NITOFLOR FC150  TRAFFIC GREEN RAL6024 (4.8L)', '4.8', 1, NULL, 0, 8, 3077800, 0, 'undefined', 0),
(489, 'undefined', 'NITOFLOR FC150  WINDOW GREY (4.8L)', '4.8', 1, NULL, 0, 8, 3077800, 0, 'undefined', 0),
(490, 'undefined', 'NITOFLOR FC150 WINDOW GREY RAL7040 (4.5L)', '4.5', 1, NULL, 0, 8, 1331000, 0, 'undefined', 0),
(491, 'undefined', 'NITOFLOR HARDTOP BLACK (25kg)', '25', 1, NULL, 0, 8, 404800, 0, 'undefined', 0),
(492, 'undefined', 'NITOFLOR HARDTOP BLUE (25kg)', '25', 1, NULL, 0, 8, 321200, 0, 'undefined', 0),
(493, 'undefined', 'NITOFLOR HARDTOP CREAM (25kg)', '25', 1, NULL, 0, 8, 334400, 0, 'undefined', 0),
(494, 'undefined', 'NITOFLOR HARDTOP DARK GREY (25kg)', '25', 1, NULL, 0, 8, 425700, 0, 'undefined', 0),
(495, 'undefined', 'NITOFLOR HARDTOP  GRASS GREEN (25kg)', '25', 1, NULL, 0, 8, 228800, 0, 'undefined', 0),
(496, 'undefined', 'NITOFLOR HARDTOP LIGHT GREY (25kg)', '25', 1, NULL, 0, 8, 378400, 0, 'undefined', 0),
(497, 'undefined', 'NITOFLOR HARDTOP  NATURAL (25kg)', '25', 1, NULL, 0, 8, 114400, 0, 'undefined', 0),
(498, 'undefined', 'NITOFLOR HARDTOP ORANGE (25kg)', '25', 1, NULL, 0, 8, 590700, 0, 'undefined', 0),
(499, 'undefined', 'NITOFLOR HARDTOP RED (25kg)', '25', 1, NULL, 0, 8, 233200, 0, 'undefined', 0);
INSERT INTO `product` (`id`, `product_code`, `name`, `specification`, `category_id`, `description`, `stock`, `unit_id`, `open_price`, `bottom_price`, `retail_id`, `min_stock`) VALUES
(500, 'undefined', 'NITOFLOR HARDTOP SUPER GREEN (25kg)', '25', 1, NULL, 0, 8, 221100, 0, 'undefined', 0),
(501, 'undefined', 'NITOFLOR HARDTOP SUPER GREY (25kg)', '25', 1, NULL, 0, 8, 540100, 0, 'undefined', 0),
(502, 'undefined', 'NITOFLOR HARDTOP WHITE (25kg)', '25', 1, NULL, 0, 8, 463100, 0, 'undefined', 0),
(503, 'undefined', 'NITOFLOR HARDTOP YELLOW (25kg)', '25', 1, NULL, 0, 8, 353100, 0, 'undefined', 0),
(504, 'undefined', 'NITOFLOR LITHURIN M (20L)', '25', 1, NULL, 0, 8, 1615900, 0, 'undefined', 0),
(505, 'undefined', 'NITOFLOR METALTOP NF NATURAL (25kg)', '25', 1, NULL, 0, 8, 302500, 0, 'undefined', 0),
(506, 'undefined', 'NITOFLOR SL2000 GRASS GREEN (15L)', '15', 1, NULL, 0, 8, 3346200, 0, 'undefined', 0),
(507, 'undefined', 'NITOFLOR SL2000 MIDDLE GRASS GREEN (15L)', '15', 1, NULL, 0, 8, 3280200, 0, 'undefined', 0),
(508, 'undefined', 'NITOFLOR SL2000 MISTY GREY (15L)', '15', 1, NULL, 0, 8, 3379200, 0, 'undefined', 0),
(509, 'undefined', 'NITOFLOR SL3000 MISTY GREY (15L)', '15', 1, NULL, 0, 8, 3073400, 0, 'undefined', 0),
(510, 'undefined', 'NITOFLOR TF5000 (28.3kg)', '28.3', 1, NULL, 0, 8, 1300200, 0, 'undefined', 0),
(511, 'undefined', 'NITOFLOR TF5000 MISTY GREY (28.3kg)', '28.3', 1, NULL, 0, 8, 1388200, 0, 'undefined', 0),
(512, 'undefined', 'NITOPRIME 25 (5KG)', '5', 1, NULL, 0, 8, 1350800, 0, 'undefined', 0),
(513, 'undefined', 'NITOPRIME 25DS (5KG)', '5', 1, NULL, 0, 8, 1488300, 0, 'undefined', 0),
(514, 'undefined', 'NITOCOTE AC CONCRETE NATURAL (20L)', '20', 1, NULL, 0, 8, 1905200, 0, 'undefined', 0),
(515, 'undefined', 'NITOCOTE CM210 GREY (31.9kg)', '31.9', 1, NULL, 0, 8, 876700, 0, 'undefined', 0),
(516, 'undefined', 'NITOCOTE EN901 BLUE RAL5012 (4L)', '4', 1, NULL, 0, 8, 2295700, 0, 'undefined', 0),
(517, 'undefined', 'NITOCOTE EN901 BRICK RED (4L)', '4', 1, NULL, 0, 8, 2306700, 0, 'undefined', 0),
(518, 'undefined', 'NITOCOTE EN901 LIGHT IVORY RAL1015 (4L)', '4', 1, NULL, 0, 8, 1827100, 0, 'undefined', 0),
(519, 'undefined', 'NITOCOTE EN901 PATINA GREEN RAL6000 (4L)', '4', 1, NULL, 0, 8, 2296800, 0, 'undefined', 0),
(520, 'undefined', 'NITOCOTE EN901 SIGNAL WHITE RAL9003 (4L)', '4', 1, NULL, 0, 8, 2269300, 0, 'undefined', 0),
(521, 'undefined', 'NITOCOTE EN901 WINDOW GREY RAL7040 (4L)', '4', 1, NULL, 0, 8, 2307800, 0, 'undefined', 0),
(522, 'undefined', 'NITOCOTE EP403 WINDOW GREY RAL7040 (4L)', '4', 1, NULL, 0, 8, 1329900, 0, 'undefined', 0),
(523, 'undefined', 'NITOCOTE EP405 JET BLACK RAL9005 (5L)', '5', 1, NULL, 0, 8, 1289200, 0, 'undefined', 0),
(524, 'undefined', 'NITOCOTE EP405 SKY BLUE RAL5015 (5L)', '5', 1, NULL, 0, 8, 1239700, 0, 'undefined', 0),
(525, 'undefined', 'NITOCOTE EP405 WINDOW GREY RAL7040 (5L)', '5', 1, NULL, 0, 8, 1265000, 0, 'undefined', 0),
(526, 'undefined', 'NITOCOTE ET550 BLACK (18L)', '18', 1, NULL, 0, 8, 4711300, 0, 'undefined', 0),
(527, 'undefined', 'NITOCOTE PE135 GREY (20L)', '20', 1, NULL, 0, 8, 5280000, 0, 'undefined', 0),
(528, 'undefined', 'NITOCOTE SN502 (20L)', '20', 1, NULL, 0, 8, 3093200, 0, 'undefined', 0),
(529, 'undefined', 'NITOCOTE SN502 (210L)', '210', 1, NULL, 0, 8, 29713200, 0, 'undefined', 0),
(530, 'undefined', 'NITOPRIME ZINCRICH (1L)', '1', 1, NULL, 0, 8, 1414600, 0, 'undefined', 0),
(531, 'undefined', 'COLPOR 200 (4L)', '4', 1, NULL, 0, 8, 1081300, 0, 'undefined', 0),
(532, 'undefined', 'EXPANDAFOAM 10mm SHEET (1m x 2m)', '1m x 2m', 1, NULL, 0, 8, 224400, 0, 'undefined', 0),
(533, 'undefined', 'EXPANDAFOAM 20mm SHEET (1m x 2m)', '1m x 2m', 1, NULL, 0, 8, 386100, 0, 'undefined', 0),
(534, 'undefined', 'EXPANDAFOAM 30mm SHEET (1m x 2m)', '1m x 2m', 1, NULL, 0, 8, 530200, 0, 'undefined', 0),
(535, 'undefined', 'FIBREBOARD SHEET 10mm (1.2m x 2.14m)', '1.2m X 2.14m', 1, NULL, 0, 8, 523600, 0, 'undefined', 0),
(536, 'undefined', 'FIBREBOARD SHEET 12mm (1.22m x 2.14m)', '1.22m X 2.14m', 1, NULL, 0, 8, 620400, 0, 'undefined', 0),
(537, 'undefined', 'FIBREBOARD SHEET 20mm (1.22m x 2.14m)', '1.22m X 2.14m', 1, NULL, 0, 8, 952600, 0, 'undefined', 0),
(538, 'undefined', 'NITOSEAL MB99 (20kg)', '20', 1, NULL, 0, 8, 1857900, 0, 'undefined', 0),
(539, 'undefined', 'NITOSEAL PU40 GREY (600ml)', '600', 1, NULL, 0, 8, 214500, 0, 'undefined', 0),
(540, 'undefined', 'PRIMER 20 (500ml)', '500', 1, NULL, 0, 8, 618200, 0, 'undefined', 0),
(541, 'undefined', 'THIOFLEX 600 GUN GRADE GREY (2.5L)', '2.5', 1, NULL, 0, 8, 1270500, 0, 'undefined', 0),
(542, 'undefined', 'BRUSHBOND FLEX (30kg)', '30', 1, NULL, 0, 8, 1178100, 0, 'undefined', 0),
(543, 'undefined', 'BRUSHBOND FLXIII GREY (41.9kg)', '41.9', 1, NULL, 0, 8, 2328700, 0, 'undefined', 0),
(544, 'undefined', 'BRUSHBOND FLXIII GREY TOP COAT (18kg)', '18', 1, NULL, 0, 8, 3333000, 0, 'undefined', 0),
(545, 'undefined', 'BRUSHBOND GREY (22.5kg)', '22.5', 1, NULL, 0, 8, 440000, 0, 'undefined', 0),
(546, 'undefined', 'BRUSHBOND TGP GREY (25kg)', '25', 1, NULL, 0, 8, 794200, 0, 'undefined', 0),
(547, 'undefined', 'NITOPROOF 30 (200L)', '200', 1, NULL, 0, 8, 14307700, 0, 'undefined', 0),
(548, 'undefined', 'NITOPROOF 30 (20L)', '20', 1, NULL, 0, 8, 1740200, 0, 'undefined', 0),
(549, 'undefined', 'NITOPROOF 600STD (19L)', '19', 1, NULL, 0, 8, 5794800, 0, 'undefined', 0),
(550, 'undefined', 'NITOPROOF AW CREAM RAL1014 (20L)', '20', 1, NULL, 0, 8, 2624600, 0, 'undefined', 0),
(551, 'undefined', 'NITOPROOF AW GREY (20L)', '20', 1, NULL, 0, 8, 1556500, 0, 'undefined', 0),
(552, 'undefined', 'NITOPROOF AW LIGHT GREY (20L)', '20', 1, NULL, 0, 8, 1521300, 0, 'undefined', 0),
(553, 'undefined', 'NITOPROOF AW WHITE (20L)', '20', 1, NULL, 0, 8, 1601600, 0, 'undefined', 0),
(554, 'undefined', 'NITOPROOF PRIMER (16kg)', '16', 1, NULL, 0, 8, 2523400, 0, 'undefined', 0),
(555, 'undefined', 'NITOPROOF PU1K GREEN (18kg)', '18', 1, NULL, 0, 8, 2904000, 0, 'undefined', 0),
(556, 'undefined', 'NITOPROOF PU1K GREY (18kg)', '18', 1, NULL, 0, 8, 2754400, 0, 'undefined', 0),
(557, 'undefined', 'NITOPROOF PU2K GREY (28kg)', '28', 1, NULL, 0, 8, 3960000, 0, 'undefined', 0),
(558, 'undefined', 'NITOPROOF PU2K TAR URETHANE (28kg)', '28', 1, NULL, 0, 8, 3366000, 0, 'undefined', 0),
(559, 'undefined', 'NITOPROOF RAINCOAT NS (16kg)', '16', 1, NULL, 0, 8, 1287000, 0, 'undefined', 0),
(560, 'undefined', 'NITOPROOF RS GREY (20L)', '20', 1, NULL, 0, 8, 1679700, 0, 'undefined', 0),
(561, 'undefined', 'NITOPROOF TOPCOAT GREY (18kg)', '18', 1, NULL, 0, 8, 3529900, 0, 'undefined', 0),
(562, 'undefined', 'PROOFEX TORCHSEAL 3PV (1mx10m)', '10', 1, NULL, 0, 8, 1447600, 0, 'undefined', 0),
(563, 'undefined', 'PROOFEX TORCHSEAL 4P SAND (1mx10m)', '10', 1, NULL, 0, 8, 2896300, 0, 'undefined', 0),
(564, 'undefined', 'SUPERCAST HYDROFOIL 150 (15m)', '15', 1, NULL, 0, 8, 2458500, 0, 'undefined', 0),
(565, 'undefined', 'SUPERCAST HYDROFOIL 200 (15m)', '15', 1, NULL, 0, 8, 3172400, 0, 'undefined', 0),
(566, 'undefined', 'SUPERCAST HYDROFOIL 250 (12m)', '12', 1, NULL, 0, 8, 4030400, 0, 'undefined', 0),
(567, 'undefined', 'SUPERCAST HYDROFOIL 300 (12m)', '12', 1, NULL, 0, 8, 4649700, 0, 'undefined', 0),
(568, 'undefined', 'SUPERCAST REARGUARD R200 (12m)', '12', 1, NULL, 0, 8, 3327500, 0, 'undefined', 0),
(569, 'undefined', 'SUPERCAST SW10 (5mm x 20mm x 15m)', '15', 1, NULL, 0, 8, 1302400, 0, 'undefined', 0),
(570, 'undefined', 'SUPERCAST SW30 ROLL (5m)', '5', 1, NULL, 0, 8, 1211100, 0, 'undefined', 0),
(571, 'undefined', 'SUPERCAST WATAFOIL 150 (20m)', '20', 1, NULL, 0, 8, 3339600, 0, 'undefined', 0),
(572, 'undefined', 'SUPERCAST WATAFOIL 200 (15m)', '15', 1, NULL, 0, 8, 3785100, 0, 'undefined', 0),
(573, 'undefined', 'SUPERCAST WATAFOIL 250 (12m)', '12', 1, NULL, 0, 8, 4258100, 0, 'undefined', 0),
(574, 'undefined', 'SUPERCAST WATAFOIL 300 (12m)', '12', 1, NULL, 0, 8, 4598000, 0, 'undefined', 0),
(575, 'undefined', 'NITOBOND AR (20L)', '20', 1, NULL, 0, 8, 2382600, 0, 'undefined', 0),
(576, 'undefined', 'NITOBOND AR (210L)', '210', 1, NULL, 0, 8, 23826000, 0, 'undefined', 0),
(577, 'undefined', 'NITOBOND EC (5kg)', '5', 1, NULL, 0, 8, 599500, 0, 'undefined', 0),
(578, 'undefined', 'NITOBOND ECM (5kg)', '5', 1, NULL, 0, 8, 574200, 0, 'undefined', 0),
(579, 'undefined', 'NITOBOND EP (5kg)', '5', 1, NULL, 0, 8, 1630200, 0, 'undefined', 0),
(580, 'undefined', 'NITOBOND EP SLOWSET (5Kg)', '5', 1, NULL, 0, 8, 2096600, 0, 'undefined', 0),
(581, 'undefined', 'NITOBOND PVA (20L)', '20', 1, NULL, 0, 8, 1016400, 0, 'undefined', 0),
(582, 'undefined', 'NITOBOND PVA (210L)', '210', 1, NULL, 0, 8, 9028800, 0, 'undefined', 0),
(583, 'undefined', 'NITOBOND SBR (20L)', '20', 1, NULL, 0, 8, 2448600, 0, 'undefined', 0),
(584, 'undefined', 'NITOBOND SBR (210L)', '210', 1, NULL, 0, 8, 25390200, 0, 'undefined', 0),
(585, 'undefined', 'NITOTILE GP GREY (25kg)', '25', 1, NULL, 0, 8, 209000, 0, 'undefined', 0),
(586, 'undefined', 'NITOTILE UW ADHESIVE (25kg)', '25', 1, NULL, 0, 8, 300300, 0, 'undefined', 0),
(587, 'undefined', 'NITOPLATE CPS512 (50mmx100m)', '50mm X 100m', 1, NULL, 0, 8, 41681200, 0, 'undefined', 0),
(588, 'undefined', 'NITOPLATE FEZ ADHESIVE (15kg)', '15', 1, NULL, 0, 8, 6897000, 0, 'undefined', 0),
(589, 'undefined', 'NITOWRAP ENCAPSULATION RESIN (15kg)', '15', 1, NULL, 0, 8, 7033400, 0, 'undefined', 0),
(590, 'undefined', 'NITOWRAP FRC300 (0.5m)', '0.5', 1, NULL, 0, 8, 44046200, 0, 'undefined', 0),
(591, 'undefined', 'NITOWRAP PRIMER (15kg)', '15', 1, NULL, 0, 8, 6656100, 0, 'undefined', 0),
(592, 'undefined', 'FOSROC SOLVENT 102 (5L)', '5', 1, NULL, 0, 8, 833800, 0, 'undefined', 0),
(593, 'undefined', 'FOSROC SOLVENT 102 (20L)', '20', 1, NULL, 0, 8, 3230700, 0, 'undefined', 0),
(594, 'undefined', 'CONBEXTRA BB80 (25KG)', '25', 1, NULL, 0, 8, 552200, 0, 'undefined', 0),
(595, 'undefined', 'CONBEXTRA BB92-O (25KG)', '25', 1, NULL, 0, 8, 776600, 0, 'undefined', 0),
(596, 'undefined', 'CONBEXTRA EP10TG (5L)', '5', 1, NULL, 0, 8, 1560900, 0, 'undefined', 0),
(597, 'undefined', 'CONBEXTRA EP120 (10L)', '10', 1, NULL, 0, 8, 1536700, 0, 'undefined', 0),
(598, 'undefined', 'CONBEXTRA EP75 (8L)', '8', 1, NULL, 0, 8, 1376100, 0, 'undefined', 0),
(599, 'undefined', 'CONBEXTRA GP (25kg)', '25', 1, NULL, 0, 8, 195800, 0, 'undefined', 0),
(600, 'undefined', 'CONBEXTRA GP PREMIX (30kg)', '30', 1, NULL, 0, 8, 250800, 0, 'undefined', 0),
(601, 'undefined', 'CONBEXTRA GPXTRA (25kg)', '25', 1, NULL, 0, 8, 231000, 0, 'undefined', 0),
(602, 'undefined', 'CONBEXTRA GPXTRA REMIX (30kg)', '30', 1, NULL, 0, 8, 308000, 0, 'undefined', 0),
(603, 'undefined', 'CONBEXTRA HF (25kg)', '25', 1, NULL, 0, 8, 270600, 0, 'undefined', 0),
(604, 'undefined', 'CONBEXTRA HF REMIX (30kg)', '30', 1, NULL, 0, 8, 342100, 0, 'undefined', 0),
(605, 'undefined', 'CONBEXTRA SF (25kg)', '25', 1, NULL, 0, 8, 242000, 0, 'undefined', 0),
(606, 'undefined', 'CONBEXTRA STD (25kg)', '25', 1, NULL, 0, 8, 171600, 0, 'undefined', 0),
(607, 'undefined', 'CONBEXTRA UW (25kg)', '25', 1, NULL, 0, 8, 420200, 0, 'undefined', 0),
(608, 'undefined', 'Deltamix SP', '30 kg', 1, NULL, 0, 10, 66000, 0, 'undefined', 0),
(609, 'undefined', 'Deltagrout CG', '25 kg', 1, NULL, 0, 11, 176000, 0, 'undefined', 0),
(610, 'undefined', 'Deltagrout CG Premix', '25 kg', 1, NULL, 0, 11, 165000, 0, 'undefined', 0),
(611, 'undefined', 'Deltagrout EA', '25 kg', 1, NULL, 0, 11, 1650000, 0, 'undefined', 0),
(612, 'undefined', 'Deltagrout EP Injection', '4 kg + 1 kg', 1, NULL, 0, 12, 1760000, 0, 'undefined', 0),
(613, 'undefined', 'Deltagrout EPWR Injection', '3 kg + 1 kg', 1, NULL, 0, 12, 1980000, 0, 'undefined', 0),
(614, 'undefined', 'Deltacon RM', '25 kg', 1, NULL, 0, 11, 247500, 0, 'undefined', 0),
(615, 'undefined', 'Deltacon RM1', '25 kg', 1, NULL, 0, 11, 165000, 0, 'undefined', 0),
(616, 'undefined', 'Deltacon MW', '25 kg', 1, NULL, 0, 11, 467500, 0, 'undefined', 0),
(617, 'undefined', 'Deltacon DE', '25 kg', 1, NULL, 0, 11, 687500, 0, 'undefined', 0),
(618, 'undefined', 'Deltacon FS', '25 kg', 1, NULL, 0, 11, 605000, 0, 'undefined', 0),
(619, 'undefined', 'Deltacon EP Mortar', '25 kg', 1, NULL, 0, 11, 3575000, 0, 'undefined', 0),
(620, 'undefined', 'Deltaplate CFP0512', '1,2 mm x 5 cm x 100 m', 1, NULL, 0, 6, 40000000, 0, 'undefined', 0),
(621, 'undefined', 'Deltaplate CFP0812', '1,2 mm x 8 cm x 100 m', 1, NULL, 0, 6, 44000000, 0, 'undefined', 0),
(622, 'undefined', 'Deltaplate CFP1012', '1,2 mm x 12 cm x 100 m', 1, NULL, 0, 6, 52000000, 0, 'undefined', 0),
(623, 'undefined', 'Deltawrap CFW', '50 cm x 100 m', 1, NULL, 0, 6, 38000000, 0, 'undefined', 0),
(624, 'undefined', 'Deltawrap EP Primer', '4 kg + 1 kg', 1, NULL, 0, 13, 1760000, 0, 'undefined', 0),
(625, 'undefined', 'Deltaplate LA', '3,55 kg + 2,45 Kg', 1, NULL, 0, 13, 822000, 0, 'undefined', 0),
(626, 'undefined', 'Deltagrout EPNS2', '2,55 kg + 1,45 kg', 1, NULL, 0, 13, 1584000, 0, 'undefined', 0),
(627, 'undefined', 'Deltahard NM Natural', '25 kg', 1, NULL, 0, 11, 137500, 0, 'undefined', 0),
(628, 'undefined', 'Deltahard NM Superlight Grey', '25 kg', 1, NULL, 0, 11, 341000, 0, 'undefined', 0),
(629, 'undefined', 'Deltahard NM Supergreen', '25 kg', 1, NULL, 0, 11, 335500, 0, 'undefined', 0),
(630, 'undefined', 'Deltafloor TC301SF Grey', '4 kg + 1,2 kg', 1, NULL, 0, 12, 1372800, 0, 'undefined', 0),
(631, 'undefined', 'Deltafloor TC301SF Yellow', '4 kg + 1,2 kg', 1, NULL, 0, 12, 1430000, 0, 'undefined', 0),
(632, 'undefined', 'Deltafloor TC301SF Clear', '4 kg + 1,2 kg', 1, NULL, 0, 12, 1716000, 0, 'undefined', 0),
(633, 'undefined', 'Deltafloor HD 5000', '1,7 kg + 0,9 kg + 25 kg', 1, NULL, 0, 12, 1335840, 0, 'undefined', 0),
(634, 'undefined', 'Deltaprime TC', '4 kg + 1 kg', 1, NULL, 0, 12, 880000, 0, 'undefined', 0),
(635, 'undefined', 'Deltaprime SF', '3,8 kg + 2 kg', 1, NULL, 0, 12, 2169200, 0, 'undefined', 0),
(636, 'undefined', 'Deltafloor CFT', '25 kg', 1, NULL, 0, 11, 220000, 0, 'undefined', 0),
(637, 'undefined', 'Deltacure PB', '30 kg', 1, NULL, 0, 14, 858000, 0, 'undefined', 0),
(638, 'undefined', 'Deltaproof AB', '20 kg', 1, NULL, 0, 15, 1980000, 0, 'undefined', 0),
(639, 'undefined', 'Deltaproof WBS', '20 kg', 1, NULL, 0, 14, 1100000, 0, 'undefined', 0),
(640, 'undefined', 'Deltaproof CB', '15 kg + 5 kg', 1, NULL, 0, 12, 528000, 0, 'undefined', 0),
(641, 'undefined', 'Deltaproof CB Flex', '20 kg + 10 kg', 1, NULL, 0, 12, 1980000, 0, 'undefined', 0),
(642, 'undefined', 'Deltamix WP', '30 kg', 1, NULL, 0, 14, 1980000, 0, 'undefined', 0),
(643, 'undefined', 'Deltatorch 3000 (4K)', '10 m', 1, NULL, 0, 6, 1078000, 0, 'undefined', 0),
(644, 'undefined', 'Deltatorch 3000 (3,5K)', '10 m', 1, NULL, 0, 6, 990000, 0, 'undefined', 0),
(645, 'undefined', 'Deltatorch 3000 (3K)', '15 m', 1, NULL, 0, 6, 1287000, 0, 'undefined', 0),
(646, 'undefined', 'Nilobit PM 4 mm Mineral Grey', '10 m', 1, NULL, 0, 6, 1210000, 0, 'undefined', 0),
(647, 'undefined', 'Nilobit PM 4 mm Mineral Green', '10 m', 1, NULL, 0, 6, 1342000, 0, 'undefined', 0),
(648, 'undefined', 'Deltatorch Primer WBS', '20 kg', 1, NULL, 0, 14, 1144000, 0, 'undefined', 0),
(649, 'undefined', 'Deltabond PS', '20 kg', 1, NULL, 0, 15, 1408000, 0, 'undefined', 0),
(650, 'undefined', 'Deltabond SB', '30 kg', 1, NULL, 0, 15, 3036000, 0, 'undefined', 0),
(651, 'undefined', 'Deltafix EP', '3,55 kg + 2,45 kg', 1, NULL, 0, 12, 1056000, 0, 'undefined', 0),
(652, 'undefined', 'WATERLOCK 1 Kg', '1 Kg (putih/ abu)', 1, NULL, 0, 8, 62700, 0, 'undefined', 0),
(653, 'undefined', 'WATERLOCK 5 Kg', '5 Kg (putih/ abu)', 1, NULL, 0, 8, 302500, 0, 'undefined', 0),
(654, 'undefined', 'WATERLOCK 20 Kg', '20 Kg (putih/ abu)', 1, NULL, 0, 8, 1177000, 0, 'undefined', 0),
(655, 'undefined', 'FK 101 5 Kg Abu', '5 Kg', 1, NULL, 0, 8, 33550, 0, 'undefined', 0),
(656, 'undefined', 'FK 101 5 Kg Putih', '5 Kg', 1, NULL, 0, 8, 36630, 0, 'undefined', 0),
(657, 'undefined', 'FK 101 30 Kg Abu', '30 Kg', 1, NULL, 0, 8, 194480, 0, 'undefined', 0),
(658, 'undefined', 'FK 101 30 Kg Putih', '30 Kg', 1, NULL, 0, 8, 209990, 0, 'undefined', 0),
(659, 'undefined', 'FK 111 5 Kg Abu', '5 Kg', 1, NULL, 0, 8, 33550, 0, 'undefined', 0),
(660, 'undefined', 'FK 111 5 Kg Putih', '5 Kg', 1, NULL, 0, 8, 36630, 0, 'undefined', 0),
(661, 'undefined', 'FK 111 30 Kg Abu', '30 Kg', 1, NULL, 0, 8, 194480, 0, 'undefined', 0),
(662, 'undefined', 'FK 111 30 Kg Putih', '30 Kg', 1, NULL, 0, 8, 209990, 0, 'undefined', 0),
(663, 'undefined', 'FS NAT 1 Kg A', '201 Abu-Abu, 202 Putih, 203 Hitam, 205 Kuning,206 Coklat, 207 Biru Muda, 210 Cream, 211 Pink,213 Hidden Yellow, 214 Clay Grey, 215 Mud Brown,216 Fish Yellow, 219 Teracota Red, 220 Coll Grey', 1, NULL, 0, 8, 15600, 0, 'undefined', 0),
(664, 'undefined', 'FS NAT 1 Kg B', '204 Merah Tua, 208 Hijau Muda, 209 Hijau Tua, 212 Biru Tua, 217 Bright Blue, 218 Salmon, 221 True Black', 1, NULL, 0, 8, 20900, 0, 'undefined', 0),
(665, 'undefined', 'JDI 100', '30 Kg', 1, NULL, 0, 8, 125900, 0, 'undefined', 0),
(666, 'undefined', 'JDI 200', '2 Kg', 1, NULL, 0, 8, 16500, 0, 'undefined', 0),
(667, 'undefined', 'LBM 116', '40 Kg Abu', 1, NULL, 0, 8, 176770, 0, 'undefined', 0),
(668, 'undefined', 'PL 115', '40 Kg Abu', 1, NULL, 0, 8, 139150, 0, 'undefined', 0),
(669, 'undefined', 'JDI 400', '40 Kg Abu', 1, NULL, 0, 8, 86075, 0, 'undefined', 0),
(670, 'undefined', 'JDI 300', '40 Kg Abu', 1, NULL, 0, 8, 122705, 0, 'undefined', 0),
(671, 'undefined', 'JDI 500', '30 Kg', 1, NULL, 0, 8, 98890, 0, 'undefined', 0),
(672, 'undefined', 'JDI 600', '30 Kg', 1, NULL, 0, 8, 299640, 0, 'undefined', 0),
(673, 'undefined', 'SC 114 Abu', '30 Kg', 1, NULL, 0, 8, 167420, 0, 'undefined', 0),
(674, 'undefined', 'SC 114 Putih', '30 Kg', 1, NULL, 0, 8, 180950, 0, 'undefined', 0),
(675, 'undefined', 'PM 113 30Kg', '01 Sand White, 02 Lite Cream, 03 Shine Yellow, 04 Sand Grey,05 Stone Grey, 06 Aqua Blue, 07 Rain Blue, 08 Deep Blue,09 Young Green, 10 Natural Green, 11 Mud Brown, 12 Choco Brown,13 Woody Red, 14 Terr', 1, NULL, 0, 8, 303435, 0, 'undefined', 0),
(676, 'undefined', 'Stone Paint 40 Kg', '01 Putih, 02 Abu Tua, 03 Coklat Muda, 04 Coklat Tua', 1, NULL, 0, 8, 483230, 0, 'undefined', 0),
(677, 'undefined', 'Self Leveling - Underlayment', '30 Kg', 1, NULL, 0, 8, 276485, 0, 'undefined', 0),
(678, 'undefined', 'Self Leveling - Overlayment', '30 Kg', 1, NULL, 0, 8, 513480, 0, 'undefined', 0),
(679, 'undefined', 'Floor Hardener', '30 Kg', 1, NULL, 0, 8, 193710, 0, 'undefined', 0),
(680, 'undefined', 'TG 300 2 Kg', '2 Kg', 1, NULL, 0, 8, 54395, 0, 'undefined', 0),
(681, 'undefined', 'TG 300 5 Kg', '5 Kg', 1, NULL, 0, 8, 126940, 0, 'undefined', 0),
(682, 'undefined', 'TG 300 20 Kg', '20 Kg', 1, NULL, 0, 8, 512160, 0, 'undefined', 0),
(683, 'undefined', 'TG 302 1 Lt ', 'Dof/ Wet Look', 1, NULL, 0, 8, 57000, 0, 'undefined', 0),
(684, 'undefined', 'TG 302 20 Lt', 'Dof/ Wet Look', 1, NULL, 0, 8, 1100000, 0, 'undefined', 0),
(685, 'undefined', 'TG 305 1 Lt ', '1 Liter', 1, NULL, 0, 8, 67430, 0, 'undefined', 0),
(686, 'undefined', 'TG 305 20 Lt', '20 Liter', 1, NULL, 0, 8, 640585, 0, 'undefined', 0),
(687, 'undefined', 'DS 105 5 Abu', 'undefined', 1, NULL, 0, 8, 74690, 0, 'undefined', 0),
(688, 'undefined', 'DS 105 30 Abu', 'undefined', 1, NULL, 0, 8, 434280, 0, 'undefined', 0),
(689, 'undefined', 'DS 105 5 Putih', 'undefined', 1, NULL, 0, 8, 81730, 0, 'undefined', 0),
(690, 'undefined', 'DS 105 30 Putih', 'undefined', 1, NULL, 0, 8, 474320, 0, 'undefined', 0),
(691, 'undefined', 'FK 103 1 Kg Abu', 'undefined', 1, NULL, 0, 8, 19360, 0, 'undefined', 0),
(692, 'undefined', 'FK 103 5 Kg Abu', 'undefined', 1, NULL, 0, 8, 91410, 0, 'undefined', 0),
(693, 'undefined', 'FK 103 30 Kg Abu', 'undefined', 1, NULL, 0, 8, 526350, 0, 'undefined', 0),
(694, 'undefined', 'FK 103 5 Kg Putih', 'undefined', 1, NULL, 0, 8, 99110, 0, 'undefined', 0),
(695, 'undefined', 'FK 103 30 Kg Putih', 'undefined', 1, NULL, 0, 8, 570460, 0, 'undefined', 0),
(696, 'undefined', 'TG 301 1L', 'undefined', 1, NULL, 0, 8, 29590, 0, 'undefined', 0),
(697, 'undefined', 'TG 301 20L', 'undefined', 1, NULL, 0, 8, 547085, 0, 'undefined', 0),
(698, 'undefined', 'TG 304', '1 liter', 1, NULL, 0, 8, 41580, 0, 'undefined', 0),
(699, 'undefined', 'CR 107', '10 Kg ; Abu', 1, NULL, 0, 8, 417120, 0, 'undefined', 0),
(700, 'undefined', 'CB 109', '1 Kg ; Abu', 1, NULL, 0, 8, 78595, 0, 'undefined', 0),
(701, 'undefined', 'HF 007', '1 Kg ; Abu', 1, NULL, 0, 8, 99220, 0, 'undefined', 0),
(702, 'undefined', 'undefined', 'undefined', 1, NULL, 0, 8, 0, 0, 'undefined', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_delivery_order`
--

CREATE TABLE `product_delivery_order` (
  `id` int(11) NOT NULL,
  `delivery_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `product_delivery_order`
--

INSERT INTO `product_delivery_order` (`id`, `delivery_order_id`, `product_id`, `amount`) VALUES
(8, 21, 100, 100),
(9, 21, 231, 120),
(14, 24, 100, 22);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_image`
--

CREATE TABLE `product_image` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `product_image`
--

INSERT INTO `product_image` (`id`, `product_id`, `image_id`) VALUES
(18, 1, 3),
(44, 22, 3),
(47, 25, 3),
(49, 30, 3),
(50, 20, 3),
(51, 20, 11),
(52, 20, 12);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_tag`
--

CREATE TABLE `product_tag` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `product_tag`
--

INSERT INTO `product_tag` (`id`, `product_id`, `tag_id`) VALUES
(5, 21, 1),
(7, 30, 1),
(8, 20, 1),
(9, 20, 4),
(10, 20, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `stock_record`
--

CREATE TABLE `stock_record` (
  `id` int(11) NOT NULL,
  `broker` int(11) NOT NULL,
  `order_item` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `order_number` int(11) NOT NULL,
  `quantity_in` int(11) NOT NULL,
  `quantity_out` int(11) NOT NULL,
  `order_status` int(11) NOT NULL,
  `seller` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `tag_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tag`
--

INSERT INTO `tag` (`id`, `tag_name`) VALUES
(1, 'Kawat Baja'),
(4, 'Kawat Baja'),
(5, 'Rangka Baja');

-- --------------------------------------------------------

--
-- Struktur dari tabel `task`
--

CREATE TABLE `task` (
  `id` int(11) NOT NULL,
  `modul` varchar(30) NOT NULL,
  `action` varchar(50) NOT NULL,
  `label` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `task`
--

INSERT INTO `task` (`id`, `modul`, `action`, `label`) VALUES
(1, 'Barang', 'add_barang', 'Add Barang'),
(4, 'Jurus', 'kamehameha', 'Kamehameha'),
(5, 'Jurus', 'rasengan', 'Rasengan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `unit`
--

CREATE TABLE `unit` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `abbreviation` varchar(20) NOT NULL,
  `description` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `unit`
--

INSERT INTO `unit` (`id`, `name`, `abbreviation`, `description`) VALUES
(1, 'undefined', 'Batang', 'undefined'),
(2, 'undefined', 'pcs', 'undefined'),
(3, 'undefined', 'm1', 'undefined'),
(4, 'undefined', 'm2', 'undefined'),
(5, 'undefined', 'lembar', 'undefined'),
(6, 'undefined', 'roll', 'undefined'),
(7, 'undefined', 'unit', 'undefined'),
(8, 'undefined', 'undefined', 'undefined'),
(9, 'undefined', 'dus', 'undefined'),
(10, 'undefined', 'liter', 'undefined'),
(11, 'undefined', 'Sak', 'undefined'),
(12, 'undefined', 'Set', 'undefined'),
(13, 'undefined', 'Kg', 'undefined'),
(14, 'undefined', 'Jerigen', 'undefined'),
(15, 'undefined', 'Pail', 'undefined');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `user_task_group_id` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(40) NOT NULL,
  `telephone` varchar(13) NOT NULL,
  `address` text NOT NULL,
  `uid` varchar(50) NOT NULL,
  `place_of_birth` varchar(40) NOT NULL,
  `date_of_birth` date NOT NULL,
  `religion` varchar(15) NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `user_task_group_id`, `name`, `email`, `telephone`, `address`, `uid`, `place_of_birth`, `date_of_birth`, `religion`, `status`) VALUES
(6, 3, 'Mahendra', 'mahendra@gmail.com', '082153027575', 'Alamat', '0QU1Zx9MgqQDhnITH0B0uOPXB6l2', 'Sampit', '2020-03-19', 'Islam', 'Belum Menikah'),
(7, 3, 'kemal', 'kemalkntl@gmail.com', '08', 'alamat', 'YjJmdUrw4vhXHsxo23ykXFm8BeF2', 'kuningan', '2020-03-19', 'Islam', 'Belum Menikah'),
(8, 20, 'nanda', 'nandakntl@gmail.com', '00', 'alamat', 'iiGZ9M4MHZPbTDeSOpEQSvnd2Eu1', 'bali, yogya katanya, aslinya fak fak', '2020-03-19', 'Islam', 'Menikah');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_task`
--

CREATE TABLE `user_task` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_task`
--

INSERT INTO `user_task` (`id`, `user_id`, `task_id`) VALUES
(22, 6, 1),
(23, 6, 4),
(24, 7, 1),
(25, 7, 4),
(26, 8, 4),
(27, 8, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_task_group`
--

CREATE TABLE `user_task_group` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_task_group`
--

INSERT INTO `user_task_group` (`id`, `name`) VALUES
(3, 'shinobi'),
(19, 'bikini bottoms'),
(20, 'tembalang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `warehouse`
--

CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `warehouse`
--

INSERT INTO `warehouse` (`id`, `name`, `address`) VALUES
(2, 'Warehouse Tembalang', 'Tembalang'),
(4, 'warehouse 3', 'tirto agung'),
(6, 'Warehouse Tembalang', 'Tembalang'),
(7, 'Warehouse x', 'Ngesrep'),
(11, 'Warehouse x', 'Ngesrep');

-- --------------------------------------------------------

--
-- Struktur dari tabel `warehouse_product`
--

CREATE TABLE `warehouse_product` (
  `id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `delivery_order`
--
ALTER TABLE `delivery_order`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `group_task`
--
ALTER TABLE `group_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user_task_group` (`user_task_group_id`),
  ADD KEY `id_task` (`task_id`);

--
-- Indeks untuk tabel `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indeks untuk tabel `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `unit` (`unit_id`);

--
-- Indeks untuk tabel `product_delivery_order`
--
ALTER TABLE `product_delivery_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deliveriy_order_id` (`delivery_order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeks untuk tabel `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `image_id` (`image_id`);

--
-- Indeks untuk tabel `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indeks untuk tabel `stock_record`
--
ALTER TABLE `stock_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `broker` (`broker`),
  ADD KEY `order_item` (`order_item`),
  ADD KEY `order_status` (`order_status`);

--
-- Indeks untuk tabel `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user_task_group` (`user_task_group_id`);

--
-- Indeks untuk tabel `user_task`
--
ALTER TABLE `user_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`user_id`),
  ADD KEY `id_task` (`task_id`);

--
-- Indeks untuk tabel `user_task_group`
--
ALTER TABLE `user_task_group`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `warehouse_product`
--
ALTER TABLE `warehouse_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `delivery_order`
--
ALTER TABLE `delivery_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `group_task`
--
ALTER TABLE `group_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=704;

--
-- AUTO_INCREMENT untuk tabel `product_delivery_order`
--
ALTER TABLE `product_delivery_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `product_image`
--
ALTER TABLE `product_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT untuk tabel `product_tag`
--
ALTER TABLE `product_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `stock_record`
--
ALTER TABLE `stock_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `task`
--
ALTER TABLE `task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `unit`
--
ALTER TABLE `unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `user_task`
--
ALTER TABLE `user_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `user_task_group`
--
ALTER TABLE `user_task_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `warehouse_product`
--
ALTER TABLE `warehouse_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `group_task`
--
ALTER TABLE `group_task`
  ADD CONSTRAINT `group_task_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `group_task_ibfk_3` FOREIGN KEY (`user_task_group_id`) REFERENCES `user_task_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `product_delivery_order`
--
ALTER TABLE `product_delivery_order`
  ADD CONSTRAINT `product_delivery_order_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_delivery_order_ibfk_2` FOREIGN KEY (`delivery_order_id`) REFERENCES `delivery_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `product_image`
--
ALTER TABLE `product_image`
  ADD CONSTRAINT `product_image_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_image_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `product_tag`
--
ALTER TABLE `product_tag`
  ADD CONSTRAINT `product_tag_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `stock_record`
--
ALTER TABLE `stock_record`
  ADD CONSTRAINT `stock_record_ibfk_1` FOREIGN KEY (`broker`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `stock_record_ibfk_3` FOREIGN KEY (`order_status`) REFERENCES `order_status` (`id`),
  ADD CONSTRAINT `stock_record_ibfk_4` FOREIGN KEY (`order_item`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`user_task_group_id`) REFERENCES `user_task_group` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user_task`
--
ALTER TABLE `user_task`
  ADD CONSTRAINT `user_task_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_task_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `warehouse_product`
--
ALTER TABLE `warehouse_product`
  ADD CONSTRAINT `warehouse_product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `warehouse_product_ibfk_2` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
