-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 04, 2020 at 04:03 PM
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
  `th_pelajaran` char(9) NOT NULL,
  `kelas` varchar(3) NOT NULL,
  `jenis` varchar(10) NOT NULL,
  `jumlah` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jenis_bayar`
--

INSERT INTO `jenis_bayar` (`th_pelajaran`, `kelas`, `jenis`, `jumlah`) VALUES
('2019/2020', '1', 'SPP', 250000),
('2019/2020', '2', 'SPP', 300000),
('2019/2020', '3', 'SPP', 350000),
('2019/2020', '4', 'SPP', 400000),
('2019/2020', '5', 'SPP', 450000),
('2019/2020', '6', 'SPP', 500000),
('2019/2020', '1', 'Kr', 5000000),
('2019/2020', '1', 'Outing', 200000);

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `kelas` varchar(10) NOT NULL,
  `th_pelajaran` varchar(12) NOT NULL,
  `nis` char(12) NOT NULL,
  `idrombel` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`kelas`, `th_pelajaran`, `nis`, `idrombel`) VALUES
('2', '2019/2020', '129371231', 'C'),
('1', '2019/2020', '202043501001', 'A'),
('1', '2019/2020', '202043501002', 'A'),
('1', '2019/2020', '202043501003', 'B'),
('1', '2019/2020', '202043501005', 'B'),
('2', '2019/2020', '202043502001', 'A'),
('3', '2019/2020', '202043503001', 'A'),
('4', '2019/2020', '202043504001', 'A'),
('2', '2019/2020', '202043504099', 'B'),
('5', '2019/2020', '202043505001', 'A'),
('6', '2019/2020', '202043506001', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `jenis` varchar(8) NOT NULL,
  `nis` char(12) NOT NULL,
  `bulan` varchar(45) NOT NULL,
  `tgl_bayar` date DEFAULT NULL,
  `jumlah` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`jenis`, `nis`, `bulan`, `tgl_bayar`, `jumlah`) VALUES
('XI-MIF', '', 'December', '2014-12-30', 85000),
('X-MIF', '', 'December', '2014-12-27', 90000),
('X-MIF', '', 'December', '2014-12-27', 90000),
('X-MIF', '', 'December', '2014-12-27', 90000),
('X-TKJ', '', 'December', '2014-12-27', 90000),
('X-TIP', '', 'December', '2014-12-27', 90000),
('X-TKJ', '', 'December', '2014-12-27', 90000),
('SPP', '', 'January', '2020-03-09', 250000),
('PTS', '202043500001', 'January', '2020-03-09', 150000),
('SPP', '202043500001', 'February', '2020-03-09', 250000),
('SPP', '202043506001', 'January', '2020-03-23', 250000),
('SPP', '202043501001', 'January', '2020-03-23', 250000),
('SPP', '202043501001', 'February', '2020-03-28', 250000),
('SPP', '202043501001', 'February', '2020-03-28', 250000),
('SPP', '202043501001', 'March', '2020-03-28', 250000),
('SPP', '202043501001', 'April', '2020-03-28', 250000),
('SPP', '202043501003', 'January', '2020-03-28', 250000),
('SPP', '202043501003', 'January', '2020-03-28', 250000),
('SPP', '202043506001', 'Januari', '2020-03-29', 250000),
('SPP', '202043501001', 'Juni', '2020-03-31', 250000),
('Kr', '202043501001', 'Januari', '2020-03-31', 5000000),
('SPP', '202043501005', 'Januari', '2020-03-31', 250000),
('Outing', '202043501005', 'Januari', '2020-03-31', 200000),
('SPP', '202043501005', 'Februari', '2020-03-31', 250000),
('SPP', '202043501005', 'Maret', '2020-03-31', 250000),
('SPP', '202043501001', 'November', '2020-04-01', 250000),
('SPP', '202043501001', 'Januari', '2020-04-01', 250000),
('SPP', '202043501001', 'Agustus', '2020-04-01', 250000),
('SPP', '202043501001', 'September', '2020-04-01', 250000),
('Outing', '202043501001', 'Oktober', '2020-04-01', 200000),
('Kr', '202043501001', 'Agustus', '2020-04-01', 5000000),
('SPP', '202043502001', 'Januari', '2020-04-01', 250000),
('SPP', '202043502001', 'April', '2020-04-01', 250000),
('SPP', '202043502001', 'Agustus', '2020-04-01', 250000),
('', '202043502001', 'Januari', '2020-04-01', 250000),
('SPP', '202043502001', 'Januari', '2020-04-01', 250000),
('SPP', '202043502001', 'Januari', '2020-04-02', 250000),
('SPP', '202043502001', 'Juni', '2020-04-02', 250000),
('SPP', '202043502001', 'Juni', '2020-04-02', 250000),
('SPP', '202043502001', 'Juli', '2020-04-02', 250000),
('SPP', '202043502001', 'Juli', '2020-04-02', 250000),
('SPP', '202043502001', 'Maret', '2020-04-02', 250000),
('SPP', '202043502001', 'Maret', '2020-04-02', 250000),
('SPP', '202043504099', 'Agustus', '2020-04-02', 250000),
('SPP', '202043504099', 'Januari', '2020-04-02', 250000),
('SPP', '202043504099', 'Januari', '2020-04-02', 250000),
('SPP', '202043504099', 'Januari', '2020-04-02', 250000),
('SPP', '202043504099', 'Januari', '2020-04-02', 250000),
('SPP', '202043504099', 'Januari', '2020-04-02', 250000),
('SPP', '129371231', 'Februari', '2020-04-03', 450000),
('SPP', '129371231', 'Januari', '2020-04-03', 450000),
('SPP', '129371231', 'Oktober', '2020-04-03', 450000),
('SPP', '129371231', 'Maret', '2020-04-04', 450000);

-- --------------------------------------------------------

--
-- Table structure for table `rombel`
--

CREATE TABLE `rombel` (
  `idrombel` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rombel`
--

INSERT INTO `rombel` (`idrombel`) VALUES
('A'),
('C');

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
(2, 'uww', 'uww123', 1, 'Adminsasa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`nis`);

--
-- Indexes for table `rombel`
--
ALTER TABLE `rombel`
  ADD PRIMARY KEY (`idrombel`);

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
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
