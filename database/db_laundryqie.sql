-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2024 at 12:31 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_laundryqie`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_h_pelanggan`
--

CREATE TABLE `tbl_h_pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(228) NOT NULL,
  `alamat_pelanggan` text NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `telp_pelanggan` varchar(15) NOT NULL,
  `no_ktp` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_h_pelanggan`
--

INSERT INTO `tbl_h_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `alamat_pelanggan`, `jenis_kelamin`, `telp_pelanggan`, `no_ktp`) VALUES
(28, 'asep haseup', 'CKM', 'L', '08567400856', '1233333333'),
(29, 'sakur', 'cikampek', 'L', '085779519540', '1233'),
(30, 'asep haseup', 'jalan jalan', 'L', '08567400856', '1233333333'),
(31, 'gegeg', 'karawanggggkdfkd', 'L', '8577951954088', '1233'),
(32, 'hvhgchgf', 'v b b ', 'L', '08576432', '54546444644'),
(33, 'Ujang', 'khjfvgjjghj', 'L', '5655655', '6565655');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_m_detail_transaksi`
--

CREATE TABLE `tbl_m_detail_transaksi` (
  `id_detail` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `qty` double NOT NULL,
  `total_harga` double NOT NULL,
  `keterangan` text NOT NULL,
  `total_bayar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_m_detail_transaksi`
--

INSERT INTO `tbl_m_detail_transaksi` (`id_detail`, `id_transaksi`, `id_paket`, `qty`, `total_harga`, `keterangan`, `total_bayar`) VALUES
(21, 42, 31, 5, 30000, '', 40000),
(22, 43, 31, 2, 12000, '', 20000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_m_outlet`
--

CREATE TABLE `tbl_m_outlet` (
  `id_outlet` int(11) NOT NULL,
  `nama_outlet` varchar(228) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alamat_outlet` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telp_outlet` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_m_outlet`
--

INSERT INTO `tbl_m_outlet` (`id_outlet`, `nama_outlet`, `alamat_outlet`, `telp_outlet`) VALUES
(9, 'Outlet 1', 'Karawang, Indonesia', '08555555555'),
(10, 'Outlet 2', 'ckm, Karawang, Indonesia', '081222222222'),
(12, 'Outlet 4', 'dengklok, Karawang', '0826377453886');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_m_paket_cuci`
--

CREATE TABLE `tbl_m_paket_cuci` (
  `id_paket` int(11) NOT NULL,
  `jenis_paket` enum('kiloan','selimut','bedcover','kaos','satuan','lain') NOT NULL,
  `nama_paket` varchar(228) NOT NULL,
  `harga` int(11) NOT NULL,
  `outlet_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_m_paket_cuci`
--

INSERT INTO `tbl_m_paket_cuci` (`id_paket`, `jenis_paket`, `nama_paket`, `harga`, `outlet_id`) VALUES
(31, 'lain', 'Pewangi Tahan Lama', 6000, 9);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_m_pelanggan`
--

CREATE TABLE `tbl_m_pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(228) NOT NULL,
  `alamat_pelanggan` text NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `telp_pelanggan` varchar(15) NOT NULL,
  `no_ktp` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_m_pelanggan`
--

INSERT INTO `tbl_m_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `alamat_pelanggan`, `jenis_kelamin`, `telp_pelanggan`, `no_ktp`) VALUES
(23, 'bedul ge', 'cilamaya', 'P', '088888888888', '123456789'),
(24, 'adul', 'ckm, Karawang', 'L', '0821123311131', '0987654321'),
(25, 'dagul', 'dengklok, Karawang', 'L', '08123456244567', '1234567890'),
(26, 'badal', 'jarong', 'L', '081736281', '461246247'),
(28, 'asep haseup', 'CKM', 'L', '08567400856', '1233333333'),
(30, 'asep haseup', 'jalan jalan', 'L', '08567400856', '1233333333'),
(33, 'Ujang9', 'khjfvgjjghj', 'L', '5655655', '6565655');

--
-- Triggers `tbl_m_pelanggan`
--
DELIMITER $$
CREATE TRIGGER `trg_insert_histori_user` AFTER INSERT ON `tbl_m_pelanggan` FOR EACH ROW BEGIN
    INSERT INTO tbl_h_pelanggan
    (
        id_pelanggan, 
        nama_pelanggan, 
        alamat_pelanggan, 
        jenis_kelamin, 
        telp_pelanggan, 
        no_ktp
    )
    VALUES
    (
        NEW.id_pelanggan, 
        NEW.nama_pelanggan, 
        NEW.alamat_pelanggan, 
        NEW.jenis_kelamin, 
        NEW.telp_pelanggan, 
        NEW.no_ktp
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_m_user`
--

CREATE TABLE `tbl_m_user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(228) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `username` varchar(228) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(228) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `outlet_id` int(11) DEFAULT NULL,
  `role` enum('admin','kasir','owner') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_m_user`
--

INSERT INTO `tbl_m_user` (`id_user`, `nama_user`, `username`, `password`, `outlet_id`, `role`) VALUES
(1, 'adminku', 'admin', '21232f297a57a5a743894a0e4a801fc3', 9, 'admin'),
(3, 'ownerku', 'owner', '72122ce96bfec66e2396d2e25225d70a', NULL, 'owner'),
(6, 'Kasir ', 'kasir', 'c7911af3adbd12a035b289556d96470a', 9, 'kasir');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_saran`
--

CREATE TABLE `tbl_saran` (
  `id_saran` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `isi_saran` text NOT NULL,
  `tgl_saran` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_saran`
--

INSERT INTO `tbl_saran` (`id_saran`, `id_pelanggan`, `isi_saran`, `tgl_saran`) VALUES
(19, 24, 'yang bener aje', '2024-01-19 18:29:12');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stockbarang`
--

CREATE TABLE `tbl_stockbarang` (
  `idbarang` int(11) NOT NULL,
  `namabarang` varchar(25) NOT NULL,
  `deskripsi` varchar(25) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_stockbarang`
--

INSERT INTO `tbl_stockbarang` (`idbarang`, `namabarang`, `deskripsi`, `stock`) VALUES
(34, 'mesin', 'bahu', 1),
(35, 'mesin', 'yaya', 12),
(36, 'cpu', 'marvin', 200),
(37, 'mesin', 'yaya', 122),
(38, 'mesin', 'farhna', 212),
(40, 'Sabun', 'aya keneh hiji mh', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_t_transaksi`
--

CREATE TABLE `tbl_t_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `outlet_id` int(11) DEFAULT NULL,
  `kode_invoice` varchar(228) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  `tgl` datetime DEFAULT NULL,
  `batas_waktu` datetime DEFAULT NULL,
  `tgl_pembayaran` datetime DEFAULT NULL,
  `biaya_tambahan` int(11) DEFAULT NULL,
  `diskon` double DEFAULT NULL,
  `pajak` int(11) DEFAULT NULL,
  `status` enum('baru','proses','selesai','diambil','diantar','dijemput') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status_bayar` enum('dibayar','belum') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_t_transaksi`
--

INSERT INTO `tbl_t_transaksi` (`id_transaksi`, `outlet_id`, `kode_invoice`, `id_pelanggan`, `tgl`, `batas_waktu`, `tgl_pembayaran`, `biaya_tambahan`, `diskon`, `pajak`, `status`, `status_bayar`, `id_user`) VALUES
(36, 9, 'QIE202009033737', 23, '2024-09-03 04:37:43', '2024-09-10 12:00:00', '2024-09-03 04:40:03', 0, 0, 0, 'baru', 'dibayar', 1),
(37, 9, 'QIE202009035702', 23, '2024-09-03 05:03:37', '2024-09-10 12:00:00', '2024-09-03 05:08:28', 0, 0, 0, 'baru', 'dibayar', 1),
(39, 10, 'QIE202009034317', 24, '2024-09-03 05:19:12', '2024-09-10 12:00:00', '2024-09-03 05:21:41', 0, 0, 0, 'baru', 'dibayar', NULL),
(40, 9, 'QIE202009040521', 24, '2024-09-04 03:21:09', '2024-09-11 12:00:00', NULL, 0, 0, 0, 'baru', 'belum', 1),
(41, 9, 'QIE202009040528', 25, '2024-09-04 03:28:21', '2024-09-11 12:00:00', '2024-09-04 03:29:00', 0, 0, 0, 'selesai', 'dibayar', 1),
(42, 9, 'QIE202401191621', 24, '2024-01-19 12:21:34', '2024-01-26 12:00:00', '2024-01-19 12:21:59', 0, 0, 0, 'baru', 'dibayar', 1),
(43, 9, 'QIE202401191426', 33, '2024-01-19 12:26:34', '2024-01-26 12:00:00', '2024-01-19 12:26:50', 0, 0, 0, 'baru', 'dibayar', 6);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_user_activity`
-- (See below for the actual view)
--
CREATE TABLE `vw_user_activity` (
`jumlah_transaksi` bigint(21)
,`jumlah_pelanggan` bigint(21)
,`jumlah_outlet` bigint(21)
,`total_penghasilan` double
,`penghasilan_tahun` double
,`penghasilan_bulan` double
,`penghasilan_minggu` double
);

-- --------------------------------------------------------

--
-- Structure for view `vw_user_activity`
--
DROP TABLE IF EXISTS `vw_user_activity`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_user_activity`  AS SELECT (select count(`tbl_t_transaksi`.`id_transaksi`) from `tbl_t_transaksi`) AS `jumlah_transaksi`, (select count(`tbl_m_pelanggan`.`id_pelanggan`) from `tbl_m_pelanggan`) AS `jumlah_pelanggan`, (select count(`tbl_m_outlet`.`id_outlet`) from `tbl_m_outlet`) AS `jumlah_outlet`, (select sum(`tbl_m_detail_transaksi`.`total_harga`) from (`tbl_m_detail_transaksi` join `tbl_t_transaksi` on(`tbl_t_transaksi`.`id_transaksi` = `tbl_m_detail_transaksi`.`id_transaksi`)) where `tbl_t_transaksi`.`status_bayar` = 'dibayar') AS `total_penghasilan`, (select sum(`tbl_m_detail_transaksi`.`total_harga`) from (`tbl_m_detail_transaksi` join `tbl_t_transaksi` on(`tbl_t_transaksi`.`id_transaksi` = `tbl_m_detail_transaksi`.`id_transaksi`)) where `tbl_t_transaksi`.`status_bayar` = 'dibayar' and year(`tbl_t_transaksi`.`tgl_pembayaran`) = year(current_timestamp())) AS `penghasilan_tahun`, (select sum(`tbl_m_detail_transaksi`.`total_harga`) from (`tbl_m_detail_transaksi` join `tbl_t_transaksi` on(`tbl_t_transaksi`.`id_transaksi` = `tbl_m_detail_transaksi`.`id_transaksi`)) where `tbl_t_transaksi`.`status_bayar` = 'dibayar' and month(`tbl_t_transaksi`.`tgl_pembayaran`) = month(current_timestamp())) AS `penghasilan_bulan`, (select sum(`tbl_m_detail_transaksi`.`total_harga`) from (`tbl_m_detail_transaksi` join `tbl_t_transaksi` on(`tbl_t_transaksi`.`id_transaksi` = `tbl_m_detail_transaksi`.`id_transaksi`)) where `tbl_t_transaksi`.`status_bayar` = 'dibayar' and week(`tbl_t_transaksi`.`tgl_pembayaran`) = week(current_timestamp())) AS `penghasilan_minggu` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_h_pelanggan`
--
ALTER TABLE `tbl_h_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `tbl_m_detail_transaksi`
--
ALTER TABLE `tbl_m_detail_transaksi`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_transaksi` (`id_transaksi`),
  ADD KEY `id_paket` (`id_paket`);

--
-- Indexes for table `tbl_m_outlet`
--
ALTER TABLE `tbl_m_outlet`
  ADD PRIMARY KEY (`id_outlet`);

--
-- Indexes for table `tbl_m_paket_cuci`
--
ALTER TABLE `tbl_m_paket_cuci`
  ADD PRIMARY KEY (`id_paket`),
  ADD KEY `outlet_id` (`outlet_id`);

--
-- Indexes for table `tbl_m_pelanggan`
--
ALTER TABLE `tbl_m_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `tbl_m_user`
--
ALTER TABLE `tbl_m_user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `outlet_id` (`outlet_id`);

--
-- Indexes for table `tbl_saran`
--
ALTER TABLE `tbl_saran`
  ADD PRIMARY KEY (`id_saran`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indexes for table `tbl_stockbarang`
--
ALTER TABLE `tbl_stockbarang`
  ADD PRIMARY KEY (`idbarang`);

--
-- Indexes for table `tbl_t_transaksi`
--
ALTER TABLE `tbl_t_transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `outlet_id` (`outlet_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_h_pelanggan`
--
ALTER TABLE `tbl_h_pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tbl_m_detail_transaksi`
--
ALTER TABLE `tbl_m_detail_transaksi`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbl_m_outlet`
--
ALTER TABLE `tbl_m_outlet`
  MODIFY `id_outlet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_m_paket_cuci`
--
ALTER TABLE `tbl_m_paket_cuci`
  MODIFY `id_paket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tbl_m_pelanggan`
--
ALTER TABLE `tbl_m_pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tbl_m_user`
--
ALTER TABLE `tbl_m_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_saran`
--
ALTER TABLE `tbl_saran`
  MODIFY `id_saran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbl_stockbarang`
--
ALTER TABLE `tbl_stockbarang`
  MODIFY `idbarang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `tbl_t_transaksi`
--
ALTER TABLE `tbl_t_transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_m_detail_transaksi`
--
ALTER TABLE `tbl_m_detail_transaksi`
  ADD CONSTRAINT `tbl_m_detail_transaksi_ibfk_3` FOREIGN KEY (`id_transaksi`) REFERENCES `tbl_t_transaksi` (`id_transaksi`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_m_detail_transaksi_ibfk_4` FOREIGN KEY (`id_paket`) REFERENCES `tbl_m_paket_cuci` (`id_paket`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_m_paket_cuci`
--
ALTER TABLE `tbl_m_paket_cuci`
  ADD CONSTRAINT `tbl_m_paket_cuci_ibfk_1` FOREIGN KEY (`outlet_id`) REFERENCES `tbl_m_outlet` (`id_outlet`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_m_paket_cuci_ibfk_2` FOREIGN KEY (`outlet_id`) REFERENCES `tbl_m_outlet` (`id_outlet`);

--
-- Constraints for table `tbl_m_user`
--
ALTER TABLE `tbl_m_user`
  ADD CONSTRAINT `tbl_m_user_ibfk_1` FOREIGN KEY (`outlet_id`) REFERENCES `tbl_m_outlet` (`id_outlet`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `tbl_t_transaksi`
--
ALTER TABLE `tbl_t_transaksi`
  ADD CONSTRAINT `tbl_t_transaksi_ibfk_4` FOREIGN KEY (`id_user`) REFERENCES `tbl_m_user` (`id_user`) ON DELETE SET NULL ON UPDATE CASCADE,
