-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Apr 2020 pada 17.35
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
(1, 'Karyawan', 'create_karyawan', 'Tambah Karyawan'),
(2, 'Karyawan', 'update_karyawan', 'Ubah Karyawan'),
(3, 'Karyawan', 'delete_karyawan', 'Hapus Karyawan'),
(4, 'Barang', 'create_barang', 'Tambah Barang'),
(5, 'Barang', 'update_barang', 'Ubah Barang'),
(6, 'Barang', 'delete_barang', 'Hapus Barang'),
(7, 'Barang', 'update_open_price', 'Ubah Open Price'),
(8, 'Stock Opname', 'create_stock_opname', 'Tambah Stock Opname'),
(9, 'Stock Opname', 'count_stock_opname', 'Hitung Stock Opname'),
(10, 'Surat Jalan', 'create_surat_jalan', 'Tambah Surat Jalan'),
(11, 'Surat Jalan', 'create_delivery_order', 'Tambah Delivery Order'),
(12, 'Surat Jalan', 'process_surat_jalan_dikirim', 'Proses Surat Jalan Dikirim'),
(13, 'Surat Jalan', 'process_surat_jalan_selesai', 'Proses Surat Jalan Selesai'),
(14, 'Surat Jalan', 'process_delivery_order', 'Proses Delivery Order');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `task`
--
ALTER TABLE `task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
