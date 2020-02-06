-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Feb 2020 pada 04.38
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.3

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
(2, 'atap'),
(3, 'lantai');

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
(16, 4, 1),
(18, 4, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `product_Id` int(11) NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `name` varchar(50) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `description` text NOT NULL,
  `stock` int(11) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `open_price` bigint(20) NOT NULL,
  `bottom_price` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`id`, `name`, `category_id`, `description`, `stock`, `unit_id`, `open_price`, `bottom_price`) VALUES
(1, 'atap 1', NULL, 'tap tap tap mantaaaaap', 100, NULL, 10000, 5000),
(3, 'keramik 1', 2, 'mik mik keramik', 100, NULL, 10000, 5000);

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
(1, '0', 'add barang', ''),
(4, '0', 'kamehameha', ''),
(5, '0', 'rasengan', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `unit`
--

CREATE TABLE `unit` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `abbreviation` varchar(5) NOT NULL,
  `description` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `unit`
--

INSERT INTO `unit` (`id`, `name`, `abbreviation`, `description`) VALUES
(1, 'kilogram', 'kg', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `user_task_group_id` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `telephone` varchar(13) NOT NULL,
  `address` text NOT NULL,
  `uid` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `user_task_group_id`, `name`, `telephone`, `address`, `uid`) VALUES
(1, 4, 'Mahendra Fakyu', '088423728248', 'Tirtoagung', 'asdasw32asds=='),
(2, NULL, 'Ananda Vijaya', '085237238232', 'Ngesrep', 'asdaswudw002032asds=='),
(3, 4, 'Satria Kemal', '089937473471', 'Banjarsari', 'awasiiaseao201e==');

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
(1, 1, 1),
(5, 2, 1),
(8, 1, 5),
(14, 3, 1),
(16, 3, 5),
(17, 2, 4);

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
(4, 'saiyan');

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
(2, 'warehouse 1', 'banjarsari'),
(4, 'warehouse 3', 'tirto agung');

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
-- Dumping data untuk tabel `warehouse_product`
--

INSERT INTO `warehouse_product` (`id`, `warehouse_id`, `product_id`) VALUES
(4, 4, 5);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
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
  ADD KEY `product_Id` (`product_Id`);

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
-- Indeks untuk tabel `stock_record`
--
ALTER TABLE `stock_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `broker` (`broker`),
  ADD KEY `order_item` (`order_item`),
  ADD KEY `order_status` (`order_status`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `group_task`
--
ALTER TABLE `group_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `stock_record`
--
ALTER TABLE `stock_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `task`
--
ALTER TABLE `task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `unit`
--
ALTER TABLE `unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user_task`
--
ALTER TABLE `user_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `user_task_group`
--
ALTER TABLE `user_task_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`product_Id`) REFERENCES `product` (`id`);

--
-- Ketidakleluasaan untuk tabel `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `stock_record`
--
ALTER TABLE `stock_record`
  ADD CONSTRAINT `stock_record_ibfk_1` FOREIGN KEY (`broker`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `stock_record_ibfk_2` FOREIGN KEY (`order_item`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `stock_record_ibfk_3` FOREIGN KEY (`order_status`) REFERENCES `order_status` (`id`);

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
