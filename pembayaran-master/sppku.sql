-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 08, 2020 at 02:18 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sppku`
--

-- --------------------------------------------------------

--
-- Table structure for table `jenis_bayar`
--

CREATE TABLE `jenis_bayar` (
  `th_pelajaran` char(9) NOT NULL,
  `tingkat` varchar(3) NOT NULL,
  `jumlah` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jenis_bayar`
--

INSERT INTO `jenis_bayar` (`th_pelajaran`, `tingkat`, `jumlah`) VALUES
('2014/2015', 'X', 90000),
('2014/2015', 'XI', 85000);

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `kelas` varchar(8) NOT NULL DEFAULT '',
  `th_pelajaran` char(9) NOT NULL DEFAULT '',
  `nis` char(10) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`kelas`, `th_pelajaran`, `nis`) VALUES
('X-MIF', '2014/2015', '2014201504'),
('X-MIF', '2014/2015', '2014201505'),
('X-MIF', '2014/2015', '2014201506'),
('X-MIF', '2014/2015', '2014201507'),
('X-MIF', '2014/2015', '2014201508'),
('X-MIF', '2014/2015', '2014201509'),
('X-MIF', '2014/2015', '2014201510'),
('X-MIF', '2014/2015', '2014201514'),
('X-MIF', '2014/2015', '2014201515'),
('X-MIF', '2014/2015', '2014201516'),
('X-MIF', '2014/2015', '2014201517'),
('X-MIF', '2014/2015', '2014201518'),
('X-MIF', '2014/2015', '2014201519'),
('X-MIF', '2014/2015', '2014201520'),
('X-MIF', '2014/2015', '2014201521'),
('X-MIF', '2014/2015', '2014201522'),
('X-MIF', '2014/2015', '2014201523'),
('X-MIF', '2014/2015', '2014201524'),
('X-MIF', '2014/2015', '2014201525'),
('X-TIP', '2014/2015', '2014201526'),
('X-TIP', '2014/2015', '2014201527'),
('X-TIP', '2014/2015', '2014201528'),
('X-TIP', '2014/2015', '2014201529'),
('X-TIP', '2014/2015', '2014201530'),
('X-TIP', '2014/2015', '2014201531'),
('X-TIP', '2014/2015', '2014201532'),
('X-TIP', '2014/2015', '2014201533'),
('X-TIP', '2014/2015', '2014201534'),
('X-TIP', '2014/2015', '2014201535'),
('X-TIP', '2014/2015', '2014201538'),
('X-TIP', '2014/2015', '2014201539'),
('X-TIP', '2014/2015', '2014201540'),
('X-TIP', '2014/2015', '2014201541'),
('X-TIP', '2014/2015', '2014201542'),
('X-TIP', '2014/2015', '2014201543'),
('X-TIP', '2014/2015', '2014201544'),
('X-TIP', '2014/2015', '2014201545'),
('X-TKJ', '2014/2015', '2014201511'),
('X-TKJ', '2014/2015', '2014201512'),
('X-TKJ', '2014/2015', '2014201513'),
('X-TKJ', '2014/2015', '2014201536'),
('X-TKJ', '2014/2015', '2014201537'),
('XI-MIF', '2014/2015', '2014201501'),
('XI-MIF', '2014/2015', '2014201502'),
('XI-MIF', '2014/2015', '2014201503');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `kelas` varchar(8) NOT NULL,
  `nis` char(10) NOT NULL,
  `bulan` varchar(45) NOT NULL,
  `tgl_bayar` date DEFAULT NULL,
  `jumlah` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`kelas`, `nis`, `bulan`, `tgl_bayar`, `jumlah`) VALUES
('X-MIF', '2014201504', 'December', '2014-12-27', 90000),
('X-MIF', '2014201507', 'December', '2014-12-27', 90000),
('X-MIF', '2014201508', 'December', '2014-12-27', 90000),
('X-TIP', '2014201535', 'December', '2014-12-27', 90000),
('X-TKJ', '2014201513', 'December', '2014-12-27', 90000),
('X-TKJ', '2014201536', 'December', '2014-12-27', 90000),
('XI-MIF', '2014201501', 'December', '2014-12-30', 85000);

-- --------------------------------------------------------

--
-- Table structure for table `prodi`
--

CREATE TABLE `prodi` (
  `idprodi` varchar(4) NOT NULL,
  `prodi` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prodi`
--

INSERT INTO `prodi` (`idprodi`, `prodi`) VALUES
('MIF', 'Manajemen Informatika'),
('TIP', 'Teknologi Industri Pangan'),
('TKJ', 'Teknik Komputer Jaringan');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `nis` char(10) NOT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `idprodi` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`nis`, `nama`, `idprodi`) VALUES
('2014201501', 'MUHAMMAD ALDIN IRFANI', 'MIF'),
('2014201502', 'ROZZY ALAMSYAH SUKMA SAEFUDIN', 'MIF'),
('2014201503', 'DIMAS SAWONG LAGA', 'MIF'),
('2014201504', 'DEDY KURNIAWAN EFENDI', 'MIF'),
('2014201505', 'MUHAMMAD FAJAR', 'MIF'),
('2014201506', 'ARIEF MAHPUTRA ARDIANSYAH', 'MIF'),
('2014201507', 'ANDRIK KUSNIAWAN', 'MIF'),
('2014201508', 'EKO SUHARTOYO', 'MIF'),
('2014201509', 'JAYIT SETYO PUTRO', 'MIF'),
('2014201510', 'ERIK KURNIAWAN', 'MIF'),
('2014201511', 'RAHMADYAN AZHAR', 'TKJ'),
('2014201512', 'VINDRA ABBI BUANA', 'TKJ'),
('2014201513', 'CAHYA PRASETYA', 'TKJ'),
('2014201514', 'HANIF AROSY AULIYA', 'MIF'),
('2014201515', 'RENDRA ALFATHRIDHO', 'MIF'),
('2014201516', 'AHMAD BADARRUDDIN', 'MIF'),
('2014201517', 'DHIMAS SUNAR MULYONO', 'MIF'),
('2014201518', 'MOH. RIDWAN', 'MIF'),
('2014201519', 'RISTANTO ARYAN PRATAMA', 'MIF'),
('2014201520', 'BAGAS SATRIA PRAKOSO', 'MIF'),
('2014201521', 'M. ALVIAN CAHYA PRADANA', 'MIF'),
('2014201522', 'AGUNG PRASTIYO', 'MIF'),
('2014201523', 'MOHAMAD IHSAN', 'MIF'),
('2014201524', 'MUHAMMAD ZAIQ FAKHRUDDIN', 'MIF'),
('2014201525', 'SULIS STYAWATI', 'MIF'),
('2014201526', 'ALDA SATRIA SUMINAR', 'TIP'),
('2014201527', 'ADIMAS SINTO DEWO', 'TIP'),
('2014201528', 'ENIK SUHARTINI', 'TIP'),
('2014201529', 'DEVI PUSPITASARI', 'TIP'),
('2014201530', 'DEWI ASMAUL SOLEKAH', 'TIP'),
('2014201531', 'YAYUK MARIYANTI', 'TIP'),
('2014201532', 'ELSA TANTRIANA YUNITA DEWI', 'TIP'),
('2014201533', 'RINA SURYANI', 'TIP'),
('2014201534', 'EVI SULISTYONINGRUM', 'TIP'),
('2014201535', 'IDA ZUBAIDAH', 'TIP'),
('2014201536', 'SILVIA MARIANA MUSTIKA', 'TKJ'),
('2014201537', 'SISKA KUSUMANING ARUM', 'TKJ'),
('2014201538', 'DEWI AFIFAH', 'TIP'),
('2014201539', 'NIKEN LAILATUL ROSYDAWATI', 'TIP'),
('2014201540', 'NINE ANZULKARINA RAMADHANI', 'TIP'),
('2014201541', 'SITI NUR HIMALAYA', 'TIP'),
('2014201542', 'PUTRI PUSPITASARI', 'TIP'),
('2014201543', 'ANA KHOIRUN NISA', 'TIP'),
('2014201544', 'MUHAMMAD MUFFIT KHOIRUDDIN', 'TIP'),
('2014201545', 'YUCKE PRAKOSO', 'TIP');

-- --------------------------------------------------------

--
-- Table structure for table `tapel`
--

CREATE TABLE `tapel` (
  `id` int(11) NOT NULL,
  `tapel` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tapel`
--

INSERT INTO `tapel` (`id`, `tapel`) VALUES
(1, '2012/2013'),
(2, '2013/2014'),
(4, '2014/2015');

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
(1, 'admin', 'admin', 1, 'Administrator');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jenis_bayar`
--
ALTER TABLE `jenis_bayar`
  ADD PRIMARY KEY (`th_pelajaran`,`tingkat`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`kelas`,`th_pelajaran`,`nis`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`kelas`,`nis`,`bulan`);

--
-- Indexes for table `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`idprodi`);

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
-- AUTO_INCREMENT for table `tapel`
--
ALTER TABLE `tapel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
