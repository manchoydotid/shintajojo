-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 13, 2020 at 08:57 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spp`
--

-- --------------------------------------------------------

--
-- Table structure for table `jenis_bayar`
--

CREATE TABLE `jenis_bayar` (
  `id_jenis_pembayaran` int(3) NOT NULL,
  `th_pelajaran` char(9) NOT NULL,
  `kelas` varchar(3) NOT NULL,
  `jenis` varchar(10) NOT NULL,
  `jumlah` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jenis_bayar`
--

INSERT INTO `jenis_bayar` (`id_jenis_pembayaran`, `th_pelajaran`, `kelas`, `jenis`, `jumlah`) VALUES
(1, '2019/2020', '1', 'SPP', 250000),
(2, '2019/2020', '2', 'SPP', 300000),
(3, '2019/2020', '3', 'SPP', 350000),
(4, '2019/2020', '4', 'SPP', 400000),
(5, '2019/2020', '5', 'SPP', 450000),
(6, '2019/2020', '6', 'SPP', 500000),
(8, '2019/2020', '5', 'Kurban', 400000);

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(8) NOT NULL,
  `jenis` varchar(8) NOT NULL,
  `nis` char(12) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `kelas` varchar(10) NOT NULL,
  `bulan` varchar(45) DEFAULT NULL,
  `tgl_bayar` date DEFAULT NULL,
  `jumlah` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `jenis`, `nis`, `nama`, `kelas`, `bulan`, `tgl_bayar`, `jumlah`) VALUES
(2, 'SPP', '120183193', 'SURYANA', '5', 'Februari', '2020-04-10', 450000),
(3, 'SPP', '120183193', 'SURYANA', '5', 'Maret', '2020-04-10', 450000),
(4, 'SPP', '120183193', 'SURYANA', '5', 'April', '2020-04-10', 450000),
(5, 'SPP', '129371231', 'PUYUH', '5', 'Januari', '2020-04-10', 450000),
(6, 'SPP', '129371231', 'PUYUH', '5', 'Februari', '2020-04-10', 450000),
(7, 'SPP', '202043501001', 'AHMAD SINAGA', '1', 'Januari', '2020-04-10', 250000),
(8, 'SPP', '202043501001', 'AHMAD SINAGA', '1', 'Februari', '2020-04-10', 250000),
(9, 'SPP', '202043501001', 'AHMAD SINAGA', '1', 'Maret', '2020-04-10', 250000),
(10, 'SPP', '202043501001', 'AHMAD SINAGA', '1', 'April', '2020-04-10', 250000),
(11, 'SPP', '202043501001', 'AHMAD SINAGA', '1', 'Mei', '2020-04-10', 250000),
(12, 'SPP', '202043501002', 'UUN', '1', 'Januari', '2020-04-10', 250000),
(13, 'SPP', '202043501002', 'UUN', '1', 'Februari', '2020-04-10', 250000),
(14, 'SPP', '202043501003', 'UCUP PUTRA', '1', 'Januari', '2020-04-10', 250000),
(15, 'SPP', '202043502001', 'SIREN MISAKA', '2', 'Januari', '2020-04-10', 300000),
(16, 'SPP', '202043502001', 'SIREN MISAKA', '2', 'Februari', '2020-04-10', 300000),
(17, 'SPP', '202043502001', 'SIREN MISAKA', '2', 'Maret', '2020-04-10', 300000),
(18, 'SPP', '202043503001', 'KIRIGAYA KAZUTO', '3', 'Januari', '2020-04-10', 350000),
(19, 'SPP', '202043503001', 'KIRIGAYA KAZUTO', '3', 'Februari', '2020-04-10', 350000),
(20, 'SPP', '202043503001', 'KIRIGAYA KAZUTO', '3', 'Maret', '2020-04-10', 350000),
(21, 'SPP', '202043503001', 'KIRIGAYA KAZUTO', '3', 'April', '2020-04-10', 350000),
(22, 'SPP', '202043503001', 'KIRIGAYA KAZUTO', '3', 'Mei', '2020-04-10', 350000),
(23, 'SPP', '202043503001', 'KIRIGAYA KAZUTO', '3', 'Juni', '2020-04-10', 350000),
(24, 'SPP', '202043504001', 'MISHA SUNKAR', '4', 'Januari', '2020-04-10', 400000),
(25, 'SPP', '202043504001', 'MISHA SUNKAR', '4', 'Februari', '2020-04-10', 400000),
(26, 'SPP', '202043504001', 'MISHA SUNKAR', '4', 'Maret', '2020-04-10', 400000),
(27, 'SPP', '202043504001', 'MISHA SUNKAR', '4', 'April', '2020-04-10', 400000),
(28, 'SPP', '202043504001', 'MISHA SUNKAR', '4', 'Mei', '2020-04-10', 400000),
(29, 'SPP', '202043504001', 'MISHA SUNKAR', '4', 'Juni', '2020-04-10', 400000),
(30, 'SPP', '202043505001', 'MIFTA NUR SITI', '5', 'Januari', '2020-04-10', 450000),
(31, 'SPP', '202043505001', 'MIFTA NUR SITI', '5', 'Februari', '2020-04-10', 450000),
(32, 'SPP', '202043505001', 'MIFTA NUR SITI', '5', 'Maret', '2020-04-10', 450000),
(33, 'SPP', '202043505001', 'MIFTA NUR SITI', '5', 'April', '2020-04-10', 450000),
(34, 'SPP', '202043506001', 'MAYURI SAFIRA ANASTASYA', '6', 'Januari', '2020-04-10', 500000),
(35, 'SPP', '202043506001', 'MAYURI SAFIRA ANASTASYA', '6', 'Februari', '2020-04-10', 500000),
(36, 'SPP', '202043506001', 'MAYURI SAFIRA ANASTASYA', '6', 'Maret', '2020-04-10', 500000),
(37, 'SPP', '202043506001', 'MAYURI SAFIRA ANASTASYA', '6', 'April', '2020-04-10', 500000),
(38, 'SPP', '202043506001', 'MAYURI SAFIRA ANASTASYA', '6', 'Mei', '2020-04-10', 500000),
(39, 'SPP', '202043506001', 'MAYURI SAFIRA ANASTASYA', '6', 'Juni', '2020-04-10', 500000),
(40, 'SPP', '202043506001', 'MAYURI SAFIRA ANASTASYA', '6', 'Juli', '2020-04-10', 500000),
(41, 'SPP', '202043506001', 'MAYURI SAFIRA ANASTASYA', '6', 'Agustus', '2020-04-10', 500000),
(42, 'SPP', '120183193', 'SURYANA', '5', 'Mei', '2020-04-10', 450000),
(43, 'Kr', '202043501001', 'AHMAD SINAGA', '1', 'Januari', '2020-04-10', 5000000),
(44, 'Outing', '202043501001', 'AHMAD SINAGA', '1', 'Januari', '2020-04-10', 200000),
(45, 'SPP', '202043501005', 'FAKIH VERO', '1', 'Januari', '2020-04-11', 250000),
(46, 'SPP', '202043501005', 'FAKIH VERO', '1', 'Februari', '2020-04-11', 250000),
(47, 'Outing', '202043501005', 'FAKIH VERO', '1', 'Februari', '2020-04-11', 200000),
(48, 'Outing', '202043501005', 'FAKIH VERO', '1', 'Januari', '2020-04-11', 200000),
(49, 'SPP', '120183193', 'SURYANA', '5', 'Januari', '2020-05-10', 450000),
(50, 'SPP', '120183193', 'SURYANA', '5', 'Juni', '2020-05-10', 450000);

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `nis` char(12) NOT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `kelas` varchar(10) NOT NULL,
  `idrombel` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`nis`, `nama`, `kelas`, `idrombel`) VALUES
('120183193', 'SURYANA', '5', 'A'),
('129371231', 'PUYUH', '5', 'C'),
('202043501001', 'AHMAD SINAGA', '1', 'A'),
('202043501002', 'UUN', '1', 'A'),
('202043501003', 'UCUP PUTRA', '1', 'B'),
('202043501005', 'FAKIH VERO', '1', 'B'),
('202043502001', 'SIREN MISAKA', '2', 'A'),
('202043503001', 'KIRIGAYA KAZUTO', '3', 'A'),
('202043504001', 'MISHA SUNKAR', '4', 'A'),
('202043504002', 'MAEMUNAH', '2', 'C'),
('202043504099', 'DORA WINATA', '2', 'B'),
('202043505001', 'MIFTA NUR SITI', '5', 'A'),
('202043506001', 'MAYURI SAFIRA ANASTASYA', '6', 'A'),
('203444', 'Bacul', '3', 'C');

-- --------------------------------------------------------

--
-- Table structure for table `tapel`
--

CREATE TABLE `tapel` (
  `id` char(10) NOT NULL,
  `tapel` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tapel`
--

INSERT INTO `tapel` (`id`, `tapel`) VALUES
('', '2019/2020');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `iduser` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `fullname` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`iduser`, `username`, `password`, `admin`, `fullname`) VALUES
(1, 'admin', 'admin', 1, 'Administrator'),
(4, 'mimin', 'mimin', 0, 'mimin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jenis_bayar`
--
ALTER TABLE `jenis_bayar`
  ADD PRIMARY KEY (`id_jenis_pembayaran`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nis`);

--
-- Indexes for table `tapel`
--
ALTER TABLE `tapel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jenis_bayar`
--
ALTER TABLE `jenis_bayar`
  MODIFY `id_jenis_pembayaran` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
