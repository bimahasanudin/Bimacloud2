-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 24 Jun 2024 pada 13.19
-- Versi Server: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fp_rentalmobil`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`) VALUES
(1, 'syahrul', '123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `daftar_mobil`
--

CREATE TABLE `daftar_mobil` (
  `kode_mobil` varchar(10) NOT NULL,
  `merk` varchar(30) NOT NULL,
  `bahan_bakar` enum('bensin','listrik','diesel') NOT NULL,
  `gambar` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `daftar_mobil`
--

INSERT INTO `daftar_mobil` (`kode_mobil`, `merk`, `bahan_bakar`, `gambar`) VALUES
('crv1801', 'Honda CR-V 2018', 'bensin', 'crv2018.png'),
('crv1802', 'Honda CR-V 2018 Matic', 'bensin', 'crv2018.png'),
('day1701', 'Daihatsu Ayla 2017', 'bensin', 'ayla2017.png'),
('inv2101', 'Toyota Innova 2021', 'diesel', 'inv2021.png'),
('jzz1301', 'Honda Jazz 2013', 'bensin', 'jazz2013.png'),
('njk1301', 'Nissan Juke 2013 RX AT', 'bensin', 'juke2013.png'),
('rsh1401', 'Toyota Rush 2014', 'bensin', 'rush2014.png'),
('rtg1701', 'Suzuki Ertiga 2017', 'bensin', 'ertiga2017.png'),
('vlz1901', 'Toyota Veloz 2019', 'bensin', 'veloz2019.png'),
('wae2401', 'Wuling Air EV 2024', 'listrik', 'wulingairev.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_mobil`
--

CREATE TABLE `detail_mobil` (
  `kode_mobil` varchar(10) NOT NULL,
  `plat_no` varchar(12) NOT NULL,
  `sewa_per_hari` int(11) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_mobil`
--

INSERT INTO `detail_mobil` (`kode_mobil`, `plat_no`, `sewa_per_hari`, `status`) VALUES
('crv1801', 'AA1111YY', 200000, 'Ready'),
('crv1801', 'AA2222QQ', 200000, 'Maintenance'),
('crv1802', 'AB2632IE', 250000, 'Ready'),
('day1701', 'AG7777Y', 225000, 'Ready'),
('vlz1901', 'B1626ER', 250000, 'Ready'),
('rsh1401', 'B7622MM', 250000, 'Ready'),
('inv2101', 'K1877J', 200000, 'Ready'),
('jzz1301', 'N8927NB', 175000, 'Ready'),
('wae2401', 'Z1234PO', 275000, 'Ready');

-- --------------------------------------------------------

--
-- Struktur dari tabel `driver`
--

CREATE TABLE `driver` (
  `id_driver` int(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `tahun_lahir` int(4) NOT NULL,
  `lisensi` varchar(10) NOT NULL,
  `sewa_per_hari` int(11) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `driver`
--

INSERT INTO `driver` (`id_driver`, `name`, `alamat`, `phone`, `tahun_lahir`, `lisensi`, `sewa_per_hari`, `image`) VALUES
(10001, 'Elon Musk', 'USA', '082882337821', 1990, 'SIM A', 50000, 'musk.jpg'),
(10002, 'Erik Ten Hag', 'Manchester', '0878387192178', 1977, 'SIM B1', 60000, 'eth.jpg'),
(10003, 'Spongebob Squarepants', 'Bikini Bottom', '081231231783', 2001, 'SIM A', 50000, 'spongebob.jpg'),
(10004, 'Patrick Star', 'Bikini Bottom', '087654321876', 2001, 'SIM B1', 70000, 'patrick.png'),
(10005, 'Darwin Nunez', 'Liverpool', '087898321745', 2000, 'SIM A', 50000, 'nunez.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang`
--

CREATE TABLE `keranjang` (
  `id_order` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `kode_mobil` varchar(8) NOT NULL,
  `merk` varchar(50) NOT NULL,
  `mobil_per_hari` int(11) NOT NULL,
  `id_driver` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `driver_per_hari` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `keranjang`
--

INSERT INTO `keranjang` (`id_order`, `id_pelanggan`, `kode_mobil`, `merk`, `mobil_per_hari`, `id_driver`, `name`, `driver_per_hari`) VALUES
(34, 2, 'crv1802', 'Honda CR-V 2018 Matic', 250000, 10002, 'Erik Ten Hag', 60000),
(36, 2, 'day1701', 'Daihatsu Ayla 2017', 225000, 10003, 'Spongebob Squarepants', 50000),
(37, 2, 'jzz1301', 'Honda Jazz 2013', 175000, 0, '', 0),
(39, 1, 'jzz1301', 'Honda Jazz 2013', 175000, 10005, 'Darwin Nunez', 55000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(6) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama`, `email`, `password`, `no_hp`, `alamat`) VALUES
(1, 'Syahrul', 'syahrul@gmail.com', '123', '081234567890', 'Jl. Kemuning No. 92 Jakarta Barat'),
(2, 'tes', 'tes@gmail.com', 'tes', '087654231211', 'Kediri'),
(3, 'khoirul', 'khoirul@gmail.com', '123', '', ''),
(5, 'riski', 'riski@gmail.com', '123', '', ''),
(7, 'nauval', 'nauval@gmail.com', '123', '', ''),
(31, 'Rodif', 'rodif@gmail.com', '1', '', ''),
(32, 'rodip', 'rullsyahrul86@gmai.com', '7', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `kode_mobil` varchar(8) NOT NULL,
  `id_driver` int(11) NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `durasi` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_order`, `id_pelanggan`, `kode_mobil`, `id_driver`, `tanggal_mulai`, `durasi`, `total`, `status`) VALUES
(60, 38, 1, 'crv1801', 10001, '2024-06-26', 5, 1250000, 'Transaksi selesai'),
(61, 39, 1, 'jzz1301', 10005, '2024-06-26', 5, 1150000, 'Transaksi ditolak');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `daftar_mobil`
--
ALTER TABLE `daftar_mobil`
  ADD PRIMARY KEY (`kode_mobil`);

--
-- Indexes for table `detail_mobil`
--
ALTER TABLE `detail_mobil`
  ADD PRIMARY KEY (`plat_no`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`id_driver`);

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id_order`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `id_driver` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10006;
--
-- AUTO_INCREMENT for table `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
