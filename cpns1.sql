-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2020 at 02:02 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

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
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(12, 'Kategori 1'),
(13, 'Kategori 2');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_order`
--

CREATE TABLE `delivery_order` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `reference_number` varchar(20) NOT NULL,
  `receiver_name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `date` date NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `delivery_order`
--

INSERT INTO `delivery_order` (`id`, `name`, `reference_number`, `receiver_name`, `address`, `description`, `date`, `status`) VALUES
(1, 'pengiriman 999', '2020-02-02', 'Asrap', 'Tembalang', 'pengiriman ke x', '2010-10-10', 'ongoing'),
(2, 'pengiriman 10', '2020-02-02', 'Asrap', 'Tembalang', 'pengiriman ke x', '2010-10-10', 'ongoing'),
(3, 'pengiriman 10', '2020-02-02', 'Asrap', 'Tembalang', 'pengiriman ke x', '2010-10-10', 'ongoing'),
(4, 'pengiriman 10', '2020-02-02', 'Asrap', 'Tembalang', 'pengiriman ke x', '2010-10-10', 'ongoing'),
(5, 'pengiriman 10', '2020-02-02', 'Asrap', 'Tembalang', 'pengiriman ke x', '2010-10-10', 'ongoing'),
(6, 'pengiriman 10', '2020-02-02', 'Asrap', 'Tembalang', 'pengiriman ke x', '2010-10-10', 'ongoing'),
(7, 'pengiriman 10', '2020-02-02', 'Asrap', 'Tembalang', 'pengiriman ke x', '2010-10-10', 'ongoing'),
(8, 'pengiriman 10', '2020-02-02', 'Asrap', 'Tembalang', 'pengiriman ke x', '2010-10-10', 'ongoing'),
(9, 'pengiriman 10', '2020-02-02', 'Asrap', 'Tembalang', 'pengiriman ke x', '2010-10-10', 'ongoing'),
(10, 'pengiriman 10', '2020-02-02', 'Asrap', 'Tembalang', 'pengiriman ke x', '2010-10-10', 'ongoing');

-- --------------------------------------------------------

--
-- Table structure for table `group_task`
--

CREATE TABLE `group_task` (
  `id` int(11) NOT NULL,
  `user_task_group_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_task`
--

INSERT INTO `group_task` (`id`, `user_task_group_id`, `task_id`) VALUES
(10, 3, 4),
(12, 3, 1),
(29, 19, 5),
(30, 20, 5),
(31, 20, 4);

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `image` text NOT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`id`, `image`, `category_id`) VALUES
(3, 'res/sdofsoeoooe.png', NULL),
(11, 'res/asdfsafdasdfasdfasd.jpg', NULL),
(12, 'res/sdofsoeoooe.png', NULL),
(15, 'res/sdofsoeoooe.png', NULL),
(16, 'res/sdofsoeoooe.png', NULL),
(17, 'res/sdofsoeoooe.png', NULL),
(18, 'res/sdofsoeoooe.png', NULL),
(20, 'res/sdofsoeoooe.png', NULL),
(21, 'res/sdofsoeoooe.png', NULL),
(22, 'res/sdofsoeoooe.png', NULL),
(23, 'res/sdofsoeoooe.png', NULL),
(27, 'res/sdofsoeoooe.png', NULL),
(28, 'res/sdofsoeoooe.png', NULL),
(29, 'res/sdofsoeoooe.png', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `product_code` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `specification` varchar(20) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `unit_id` int(11) DEFAULT NULL,
  `open_price` bigint(20) NOT NULL,
  `bottom_price` bigint(20) NOT NULL,
  `retail_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `product_code`, `name`, `specification`, `category_id`, `description`, `stock`, `unit_id`, `open_price`, `bottom_price`, `retail_id`) VALUES
(35, '', ' Smartruss Truecore C.75.100 ra', ' 9 m', 12, '', 100, 147, 100000, 80000, ''),
(36, '', ' Smartruss Truecore C.75.75 ra', '9m', 13, '', 10, 147, 80000, 40000, ''),
(37, '', ' Hollow galvalum 2 x 4 (0.30)', ' 4 m', 12, NULL, 100, 147, 100000, 80000, ''),
(38, '', ' Screw Roofing  2 cm', '2 cm', 13, NULL, 5, 148, 20000, 1000, '');

-- --------------------------------------------------------

--
-- Table structure for table `product_delivery_order`
--

CREATE TABLE `product_delivery_order` (
  `id` int(11) NOT NULL,
  `delivery_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE `product_image` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_tag`
--

CREATE TABLE `product_tag` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_tag`
--

INSERT INTO `product_tag` (`id`, `product_id`, `tag_id`) VALUES
(21, 35, 6),
(22, 35, 7),
(23, 36, 7),
(24, 36, 8),
(25, 37, 7),
(26, 37, 6),
(27, 38, 6);

-- --------------------------------------------------------

--
-- Table structure for table `stock_record`
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
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `tag_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `tag_name`) VALUES
(6, 'Tag 1'),
(7, 'Tag 2'),
(8, 'Tag 3');

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `id` int(11) NOT NULL,
  `modul` varchar(30) NOT NULL,
  `action` varchar(50) NOT NULL,
  `label` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`id`, `modul`, `action`, `label`) VALUES
(1, 'Barang', 'add_barang', 'Add Barang'),
(4, 'Jurus', 'kamehameha', 'Kamehameha'),
(5, 'Jurus', 'rasengan', 'Rasengan');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `abbreviation` varchar(5) NOT NULL,
  `description` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`id`, `name`, `abbreviation`, `description`) VALUES
(145, 'Satuan 1', '', ''),
(146, 'Satuan 2', 'Satua', 'Satuan 2'),
(147, 'Batang', 'Batan', 'Batang'),
(148, 'pcs', 'pcs', 'pcs');

-- --------------------------------------------------------

--
-- Table structure for table `user`
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
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user_task_group_id`, `name`, `email`, `telephone`, `address`, `uid`, `place_of_birth`, `date_of_birth`, `religion`, `status`) VALUES
(1, NULL, 'Mahendra Fajar', '', '088423728248', 'Tembalang', 'asdasw32asds==', '', '2019-04-10', '', ''),
(2, NULL, 'Ananda Vijaya', '', '085237238232', 'Ngesrep', 'asdaswudw002032asds==', '', '0000-00-00', '', ''),
(3, NULL, 'Satria Kemal', '', '089937473471', 'Banjarsari', 'awasiiaseao201e==', '', '0000-00-00', '', ''),
(4, 3, 'Satria Kemal', '', '08293289382', 'Tembalang', '1203290232802491', 'Asgard', '0000-00-00', 'islam', ''),
(5, 3, 'Satria Kemal', '', '08293289382', 'Tembalang', '1203290232802491', 'Asgard', '0000-00-00', 'islam', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_task`
--

CREATE TABLE `user_task` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_task`
--

INSERT INTO `user_task` (`id`, `user_id`, `task_id`) VALUES
(5, 2, 1),
(17, 2, 4),
(18, 4, 1),
(19, 4, 4),
(20, 5, 1),
(21, 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `user_task_group`
--

CREATE TABLE `user_task_group` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_task_group`
--

INSERT INTO `user_task_group` (`id`, `name`) VALUES
(3, 'shinobi'),
(19, 'bikini bottoms'),
(20, 'tembalang');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`id`, `name`, `address`) VALUES
(2, 'Warehouse Tembalang', 'Tembalang'),
(4, 'warehouse 3', 'tirto agung'),
(6, 'Warehouse Tembalang', 'Tembalang'),
(7, 'Warehouse x', 'Ngesrep'),
(11, 'Warehouse x', 'Ngesrep');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_product`
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
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_order`
--
ALTER TABLE `delivery_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_task`
--
ALTER TABLE `group_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user_task_group` (`user_task_group_id`),
  ADD KEY `id_task` (`task_id`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `unit` (`unit_id`);

--
-- Indexes for table `product_delivery_order`
--
ALTER TABLE `product_delivery_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deliveriy_order_id` (`delivery_order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `image_id` (`image_id`);

--
-- Indexes for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indexes for table `stock_record`
--
ALTER TABLE `stock_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `broker` (`broker`),
  ADD KEY `order_item` (`order_item`),
  ADD KEY `order_status` (`order_status`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user_task_group` (`user_task_group_id`);

--
-- Indexes for table `user_task`
--
ALTER TABLE `user_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`user_id`),
  ADD KEY `id_task` (`task_id`);

--
-- Indexes for table `user_task_group`
--
ALTER TABLE `user_task_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouse_product`
--
ALTER TABLE `warehouse_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `delivery_order`
--
ALTER TABLE `delivery_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `group_task`
--
ALTER TABLE `group_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `product_delivery_order`
--
ALTER TABLE `product_delivery_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_image`
--
ALTER TABLE `product_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `product_tag`
--
ALTER TABLE `product_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `stock_record`
--
ALTER TABLE `stock_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_task`
--
ALTER TABLE `user_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `user_task_group`
--
ALTER TABLE `user_task_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `warehouse_product`
--
ALTER TABLE `warehouse_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `group_task`
--
ALTER TABLE `group_task`
  ADD CONSTRAINT `group_task_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `group_task_ibfk_3` FOREIGN KEY (`user_task_group_id`) REFERENCES `user_task_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `product_delivery_order`
--
ALTER TABLE `product_delivery_order`
  ADD CONSTRAINT `product_delivery_order_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_delivery_order_ibfk_2` FOREIGN KEY (`delivery_order_id`) REFERENCES `delivery_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_image`
--
ALTER TABLE `product_image`
  ADD CONSTRAINT `product_image_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_image_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD CONSTRAINT `product_tag_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stock_record`
--
ALTER TABLE `stock_record`
  ADD CONSTRAINT `stock_record_ibfk_1` FOREIGN KEY (`broker`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `stock_record_ibfk_3` FOREIGN KEY (`order_status`) REFERENCES `order_status` (`id`),
  ADD CONSTRAINT `stock_record_ibfk_4` FOREIGN KEY (`order_item`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`user_task_group_id`) REFERENCES `user_task_group` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `user_task`
--
ALTER TABLE `user_task`
  ADD CONSTRAINT `user_task_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_task_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `warehouse_product`
--
ALTER TABLE `warehouse_product`
  ADD CONSTRAINT `warehouse_product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `warehouse_product_ibfk_2` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
