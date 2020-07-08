-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 08, 2020 at 02:07 PM
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
  `th_pelajaran` char(9) NOT NULL,
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

INSERT INTO `pembayaran` (`id_pembayaran`, `th_pelajaran`, `jenis`, `nis`, `nama`, `kelas`, `bulan`, `tgl_bayar`, `jumlah`) VALUES
(57, '2019/2020', 'SPP', '190001', 'AHMAD FAUZI', '1', 'Januari', '2020-07-08', 250000),
(58, '2019/2020', 'SPP', '190001', 'AHMAD FAUZI', '1', 'Februari', '2020-07-08', 250000),
(59, '2019/2020', 'SPP', '190001', 'AHMAD FAUZI', '1', 'Maret', '2020-07-08', 250000),
(60, '2019/2020', 'SPP', '190002', 'AMIRA OLIVIA AFIFAH', '1', 'Januari', '2020-07-08', 250000),
(61, '2019/2020', 'SPP', '190002', 'AMIRA OLIVIA AFIFAH', '1', 'Februari', '2020-07-08', 250000),
(62, '2019/2020', 'SPP', '190002', 'AMIRA OLIVIA AFIFAH', '1', 'Maret', '2020-07-08', 250000),
(63, '2019/2020', 'SPP', '190002', 'AMIRA OLIVIA AFIFAH', '1', 'April', '2020-07-08', 250000),
(64, '2019/2020', 'SPP', '180011', ' FATHUR RAHMAN', '2', 'Januari', '2020-07-08', 300000),
(65, '2019/2020', 'SPP', '180011', ' FATHUR RAHMAN', '2', 'Februari', '2020-07-08', 300000),
(66, '2019/2020', 'SPP', '180011', ' FATHUR RAHMAN', '2', 'Maret', '2020-07-08', 300000),
(67, '2019/2020', 'SPP', '180011', ' FATHUR RAHMAN', '2', 'April', '2020-07-08', 300000),
(68, '2019/2020', 'SPP', '170003', 'AMIRA LIYA ZAFIRA', '3', 'Januari', '2020-07-08', 350000),
(69, '2019/2020', 'SPP', '170003', 'AMIRA LIYA ZAFIRA', '3', 'Februari', '2020-07-08', 350000),
(70, '2019/2020', 'SPP', '170003', 'AMIRA LIYA ZAFIRA', '3', 'Maret', '2020-07-08', 350000),
(71, '2019/2020', 'SPP', '170003', 'AMIRA LIYA ZAFIRA', '3', 'April', '2020-07-08', 350000),
(72, '2019/2020', 'SPP', '170003', 'AMIRA LIYA ZAFIRA', '3', 'Mei', '2020-07-08', 350000),
(73, '2019/2020', 'SPP', '170009', 'DAFFA ATHILLA DZAKY', '3', 'Januari', '2020-07-08', 350000),
(74, '2019/2020', 'SPP', '170009', 'DAFFA ATHILLA DZAKY', '3', 'Februari', '2020-07-08', 350000),
(75, '2019/2020', 'SPP', '170009', 'DAFFA ATHILLA DZAKY', '3', 'Maret', '2020-07-08', 350000),
(76, '2019/2020', 'SPP', '170009', 'DAFFA ATHILLA DZAKY', '3', 'April', '2020-07-08', 350000),
(77, '2019/2020', 'SPP', '180115', 'AGHA ARCADIA OMAR KALEB', '4', 'Januari', '2020-07-08', 400000),
(78, '2019/2020', 'SPP', '180115', 'AGHA ARCADIA OMAR KALEB', '4', 'Februari', '2020-07-08', 400000),
(79, '2019/2020', 'SPP', '180115', 'AGHA ARCADIA OMAR KALEB', '4', 'Maret', '2020-07-08', 400000),
(80, '2019/2020', 'SPP', '180115', 'AGHA ARCADIA OMAR KALEB', '4', 'April', '2020-07-08', 400000),
(81, '2019/2020', 'SPP', '180115', 'AGHA ARCADIA OMAR KALEB', '4', 'Mei', '2020-07-08', 400000),
(82, '2019/2020', 'SPP', '180115', 'AGHA ARCADIA OMAR KALEB', '4', 'Juni', '2020-07-08', 400000),
(83, '2019/2020', 'SPP', '180115', 'AGHA ARCADIA OMAR KALEB', '4', 'Juli', '2020-07-08', 400000),
(84, '2019/2020', 'SPP', '170115', 'MUHAMMAD KAMIL DAFI', '5', 'Januari', '2020-07-08', 450000),
(85, '2019/2020', 'SPP', '170115', 'MUHAMMAD KAMIL DAFI', '5', 'Februari', '2020-07-08', 450000),
(86, '2019/2020', 'SPP', '170115', 'MUHAMMAD KAMIL DAFI', '5', 'Maret', '2020-07-08', 450000),
(87, '2019/2020', 'SPP', '170115', 'MUHAMMAD KAMIL DAFI', '5', 'April', '2020-07-08', 450000),
(89, '2019/2020', 'Kurban', '170115', 'MUHAMMAD KAMIL DAFI', '5', 'Juli', '2020-07-08', 400000),
(90, '2019/2020', 'SPP', '170115', 'MUHAMMAD KAMIL DAFI', '5', 'Juli', '2020-07-08', 450000),
(91, '2019/2020', 'SPP', '170117', 'TADZKIYA NAYLA AMANI', '5', 'Januari', '2020-07-08', 450000),
(92, '2019/2020', 'Kurban', '170117', 'TADZKIYA NAYLA AMANI', '5', 'Juli', '2020-07-08', 400000);

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
('170002', 'ALMAS RYFAI', '3', 'B'),
('170003', 'AMIRA LIYA ZAFIRA', '3', 'A'),
('170004', 'ASYFA FITRI NURHAFIZAH', '3', 'C'),
('170005', 'ATHAYA NUR INTAN SYAHIRA', '3', 'C'),
('170006', 'AXELLE AURELIA WAHYUDI', '3', 'A'),
('170007', 'BIHAQQI FAYYAZA WASI HUSNA', '3', 'A'),
('170008', 'CHARISSA RAZANAH ZOYA', '3', 'A'),
('170009', 'DAFFA ATHILLA DZAKY', '3', 'B'),
('170010', 'FADIL AHMAD NASUTION', '3', 'C'),
('170011', 'FATHAR ALFAREZEL BAHRI', '3', 'C'),
('170012', 'HASNA NABILA SYARIFAH', '3', 'A'),
('170013', 'HAURA NAMIAH CIPTA', '3', 'B'),
('170014', 'ILHAM WIJAYA', '3', 'B'),
('170016', 'KEANO ARKHAN BACHDIM', '3', 'A'),
('170017', 'KHALEELLA ANANDA GUNAWAN', '3', 'C'),
('170018', 'KHISYA NAZILA ASYAFA ', '3', 'B'),
('170020', 'LATHIFAH TAUFIQAH', '3', 'A'),
('170021', 'MUHAMMAD GIBRAN NUGRAHA', '3', 'A'),
('170022', 'MUHAMMAD SYAMIL AL-KHATAB', '3', 'C'),
('170023', 'MUHAMMAD ALGHAZY ABIYU', '3', 'B'),
('170024', 'MUHAMMAD HAFIDZ MARDIANSYAH', '3', 'B'),
('170025', 'MUHAMMAD MUNZIR ZAIRIS', '3', 'A'),
('170026', 'MUHAMMAD RASYA ADITYA IRWAN', '3', 'A'),
('170027', 'MUTIARA NUR DIANA', '3', 'C'),
('170028', 'NAUFAL ADZ-DZAKI YUSUF BAYUNOVA', '3', 'C'),
('170029', 'NISRINA NANDHIA PUTRI', '3', 'B'),
('170030', 'RYU ARFA SATRIA', '3', 'B'),
('170031', 'SABRINA GLADIES RIYANTI', '3', 'C'),
('170032', 'SYAKIRA NILAM SOLEKAH', '3', 'B'),
('170033', 'TSAMARAH ADILA SYAHNA', '3', 'B'),
('170034', 'ULFAH ZAHIRAH', '3', 'C'),
('170035', 'ZULFARA PUTRI SALSABIL', '3', 'C'),
('170036', 'AKBAR MAULANA SAPUTRA', '3', 'B'),
('170037', 'ALVINO HANIF SYAHBANA', '3', 'B'),
('170038', 'ANDRA GHAILAN ABQORY', '3', 'C'),
('170039', 'ANNISA NUR AZIZAH', '3', 'B'),
('170040', 'ARFAH NAUVAL RAIHAAN', '3', 'A'),
('170041', 'ARKAN NURANDI TAJRIANSYAH', '3', 'C'),
('170042', 'BAIZA ADELARD AL FARUQ', '3', 'C'),
('170043', 'BAARLY HILBRAM ALKABIR', '3', 'B'),
('170044', 'DWIYOGO ARGO PRIYONO', '3', 'A'),
('170045', 'FATHIMAH AZAHRA', '3', 'C'),
('170046', 'HANIFAH ATIKAH ZAHRA', '3', 'B'),
('170047', 'HUSEIN ALI', '3', 'A'),
('170049', 'KEYSYA KANZA DEPITA', '3', 'B'),
('170050', 'KIRANA QURRATU\' AINI', '3', 'C'),
('170051', 'LUTFIA NURHAZRIATI ZAKARIA', '3', 'B'),
('170052', 'MUHAMMAD AIDIL ARFA', '3', 'C'),
('170053', 'MUHAMAD FADLI FEBRIANTO', '3', 'C'),
('170054', 'MADINA ALYA VEGA', '3', 'A'),
('170055', 'MARWAH AFIFAH AZZEIN', '3', 'C'),
('170056', 'MOHAMAD PAHRI', '3', 'B'),
('170057', 'MUHAMAD KEPIN', '3', 'B'),
('170058', 'MUHAMMAD AZKA ABDUL BASITH', '3', 'A'),
('170059', 'MUHAMMAD DZIKRI ALVIANSYAH', '3', 'B'),
('170060', 'MUHAMMAD DZULFIKAR', '3', 'B'),
('170061', 'MUHAMMAD REZA FEBRIAN', '3', 'A'),
('170062', 'NABILAH SAIDIN', '3', 'B'),
('170063', 'NAI\'YA NOER AZIZA', '3', 'B'),
('170064', 'PUTRI KHAIRUN NISA', '3', 'C'),
('170065', 'RAIHANA BILQIS', '3', 'C'),
('170066', 'RAISHA SALIHA ATHAILLAH', '3', 'B'),
('170067', 'RIZKY AQILA RAMADHAN', '3', 'C'),
('170068', 'ROBY SYAHLUSYABANI', '3', 'A'),
('170069', ' SATRIO BUDI UTOMO', '2', 'C'),
('170070', 'UMAR SYAIFUL AR-ROHMAN', '3', 'B'),
('170071', 'WINDA FAUZIAH', '3', 'C'),
('170072', 'ZAQIYA SALSABILLA SANDHY', '3', 'A'),
('170073', 'AFFAN KAIBO ANANDAR', '3', 'A'),
('170074', 'AHMAD TAJUL \'ARIFIN', '3', 'B'),
('170075', 'ALMIRA SOFIA YASMIN', '3', 'A'),
('170076', 'ARRAS ROBANI AKBAR', '3', 'C'),
('170077', 'ASRUL SANI AL GHIFARI', '3', 'A'),
('170078', 'AULIA LUTHFIANA NUR AZIZAH', '3', 'B'),
('170079', 'AZZA SYAHARA PUTRI', '3', 'C'),
('170080', 'FAHMAN HADI GUSTYANDRA', '3', 'C'),
('170081', 'FERNANDA MUSTAQIIM', '3', 'C'),
('170083', 'GINA RULA FRIHASNAH', '3', 'A'),
('170084', 'JIHAN LUTHFIANA', '3', 'A'),
('170085', 'JIHAN ZHARIFA AULIA PUTRI', '3', 'B'),
('170086', 'KENARU ANINDYA PRATAMA', '3', 'A'),
('170087', 'KENZIE ATHAYA YUSTIAWAN', '3', 'B'),
('170088', 'KIRANA SYAHPUTRI', '3', 'B'),
('170089', 'MUHAMAD FAJAR AL RAFFI', '3', 'A'),
('170090', 'MUHAMAD IBNU DHIYAUL AHYAN', '3', 'C'),
('170091', 'MUHAMMAD BAGHIR SHOLEH', '3', 'B'),
('170092', 'MUHAMMAD FARHAN', '3', 'A'),
('170093', 'MUHAMMAD FATIH', '3', 'B'),
('170094', 'MUHAMMAD ROUF AHNAF ', '3', 'A'),
('170095', 'NABILA HERLIYANTI', '3', 'A'),
('170096', 'NAILA MARDIA ULFAH', '3', 'B'),
('170097', 'NA\'ILAH TALITA HASNA', '3', 'C'),
('170098', 'NOVELIANI AZZAHRA', '3', 'C'),
('170099', 'PUTRI RODLOTUL AKMALA', '3', 'C'),
('170100', 'QOTRUNNADA DEANA RAFIFAH', '3', 'A'),
('170101', 'QUEEN BILQIS DAVINA MISBAH', '3', 'A'),
('170102', 'RAGHIB GHATFAN AL KHATHIR', '3', 'B'),
('170103', 'RANASYAH UNZILLA YASMIN', '3', 'C'),
('170104', 'REVALINA ANINDYA PUTRI', '3', 'C'),
('170105', 'RIKO HAIDAR RASYID', '3', 'C'),
('170106', 'SHAFIRA RAHMA AZURA', '3', 'A'),
('170107', 'SYAFIRA SEPTANIA RAMADHANI ', '3', 'B'),
('170108', 'WIRA TEZA WARDANI', '3', 'B'),
('170109', 'ZASKIA DECY SUHENDRO', '3', 'C'),
('170110', 'AURAREL KRISOVI RAMDHAN', '6', 'C'),
('170111', 'ATHIRA SYAHNA SYAKIRA', '4', 'B'),
('170113', 'SAFINA AZKA MONTANA', '4', 'A'),
('170114', 'PRISYA ANANDA PUTRI', '5', 'C'),
('170115', 'MUHAMMAD KAMIL DAFI', '5', 'A'),
('170116', 'ZHIVANA GADIS ALINA', '5', 'C'),
('170117', 'TADZKIYA NAYLA AMANI', '5', 'A'),
('170121', 'DENNIS HERWINDO', '4', 'B'),
('170122', 'AQNINA PUTRI SYAKIRA', '6', 'C'),
('170123', 'OZHUR ZIHRAN ADAM', '6', 'B'),
('170124', 'ADISTY AURELLIA', '6', 'B'),
('170125', 'NAFISHA ZASKIA WIJAYA', '3', 'C'),
('170126', 'NAISYA AZIRA WIJAYA', '4', 'A'),
('170127', 'ADINDA AZ-ZAHRA', '4', 'A'),
('170128', 'PRIMA ANDIKA PRAWIRA', '4', 'B'),
('170130', 'SYARMADANSYAH ZAHIR INIESTA SIREGAR', '3', 'A'),
('170131', 'REYVINO SATRIANI SILALAHI', '3', 'A'),
('180001', ' ABDURRAHMAN FAQIH AHMAD', '2', 'B'),
('180002', ' ALDAN  DEMA YULIARSYAH', '2', 'A'),
('180003', ' ALIF RAMADHAN BAGAS SETIADI', '2', 'A'),
('180004', ' AMANDA  USWATUN HASANAH', '2', 'A'),
('180005', ' ANRYLA ADITYA', '2', 'C'),
('180006', ' ARYA ZAVIER ALFARIZY', '2', 'C'),
('180007', ' BARRA HAMZAH  WIBOWO', '2', 'C'),
('180008', ' DEWA KENZIE KIANO SETIAWAN', '2', 'C'),
('180009', ' DUROTUN KHASANAH', '2', 'B'),
('180010', ' FAIRUZ ATHA FADILAH', '2', 'A'),
('180011', ' FATHUR RAHMAN', '2', 'A'),
('180012', ' HAFIZAH ANATASYAH RIADY', '2', 'C'),
('180013', ' HAIKAL IZZA IRFANI', '2', 'C'),
('180014', ' HUMAIRAH AFIFAH', '2', 'C'),
('180015', ' JIHAN DWI SAFITRI', '2', 'B'),
('180016', ' KEOLA OMAR GEMILANG', '2', 'A'),
('180017', ' KIMFAIZ AGA PRATAMA', '2', 'B'),
('180018', ' MAHIRA ZHARFA  SALIM', '2', 'B'),
('180019', ' MISSELA IHDA FARRASI', '2', 'C'),
('180020', ' MUHAMMAD AL FATHI REVALIO', '2', 'B'),
('180021', ' MUHAMMAD IBNU HAKIM', '2', 'A'),
('180022', ' MUNGGARAN DWEISYABAN', '2', 'C'),
('180023', ' NAURA AQILA', '2', 'A'),
('180024', ' NAYOTTAMA PARAHITA INARA', '2', 'A'),
('180025', ' PUTRI KAISAH  ZAAKIRAH', '2', 'B'),
('180026', ' QURROTA  A\'YUN', '2', 'B'),
('180027', ' RAAFI ALQUTHB DZAKWAN', '2', 'A'),
('180028', ' RAFAEL PUTRA SURYA', '2', 'B'),
('180029', ' RAFFA GHARIN ARCADIA', '2', 'C'),
('180030', ' RAID MINARNO', '2', 'B'),
('180031', ' RAISHA ARETHA', '2', 'C'),
('180032', ' SHABRIA AMIRA KINA', '2', 'B'),
('180033', ' SHALSYABILLAH PERMATA PUTRI HASAN', '2', 'C'),
('180034', ' SYIFA FAUZI DERMAWAN', '2', 'A'),
('180035', ' YUMNA AQILAH NUR HUSNIYAH', '2', 'A'),
('180036', ' ZAHRA MUFLIHATUL AWALIYAH', '2', 'A'),
('180037', ' ACHMAD  SYAUGI', '2', 'C'),
('180038', ' ADJIE AGUNG SOEPRAPTO', '2', 'A'),
('180039', ' AHMAD REVAN ALFARIZI', '2', 'A'),
('180040', ' AISYAH AYU SHAFIRA', '2', 'A'),
('180041', ' ALVIANSYAH HIDAYAH', '2', 'C'),
('180042', ' APTA DZIKRI RUSWANDI', '2', 'C'),
('180043', ' ARIZA ALVIAN SYAHPUTRA', '2', 'A'),
('180044', ' AUFAR  AHMAD SAMMAN', '2', 'C'),
('180045', ' CINTA  AMANABILA', '2', 'A'),
('180046', ' DANISH AZZWA ARASYA', '2', 'B'),
('180047', ' DEVIN AZRI DESTIAN', '2', 'B'),
('180049', ' FARIZA AL MAHYRA', '2', 'C'),
('180050', ' FATHAN FADILLLAH', '2', 'B'),
('180052', ' FHELIA PUTRI SAYYIDAH', '2', 'C'),
('180053', ' FILDZA QONITA FADANTHYA', '2', 'B'),
('180055', ' ISHA BELLA LESTARI', '2', 'C'),
('180056', ' KAIYA NAFLISAH  SYAHLA', '2', 'B'),
('180057', ' MUHAMAD  ABDI RASYID', '2', 'C'),
('180058', ' MUHAMMAD  NIZAM HARVIANTO', '2', 'A'),
('180059', ' MUHAMMAD ADAM GERRARD PURNOMO', '2', 'C'),
('180060', ' MUHAMMAD AL FARABI GUNAWAN', '2', 'C'),
('180061', ' MUHAMMAD FACHRI  RAMADHAN ', '2', 'A'),
('180062', ' MUHAMMAD FADHILURROKHMAN', '2', 'A'),
('180063', ' MUHAMMAD IKBAL SYAMSI', '2', 'B'),
('180064', ' MUHAMMAD RAFA ', '2', 'A'),
('180065', ' MUHAMMAD RAFFA ARDYANA', '2', 'B'),
('180066', ' MUHAMMAD REZKY IRAWAN', '2', 'B'),
('180067', ' MUHAMMAD YAHYA', '2', 'B'),
('180068', ' RESI GANESHA WICAKSONO', '2', 'C'),
('180069', ' RIZKI MUBAROK', '2', 'B'),
('180070', ' RIZKI RAMADHAN', '2', 'A'),
('180072', ' VIOLA  ALKHAIRA RINALDI ', '2', 'A'),
('180073', ' ZAIRA UZMA', '2', 'A'),
('180074', ' ADE PUTRI ARSANDI', '2', 'B'),
('180075', ' ADI SAPUTRA', '2', 'A'),
('180076', ' ADRIAN  NUR DANI CHAMIL', '2', 'C'),
('180077', ' AHZA AZIB SATTAR', '2', 'A'),
('180078', ' AISYAH SILMI AFIQA', '2', 'A'),
('180079', ' AKHMAL PRATAMA ROMADHON', '2', 'A'),
('180080', ' ALZELINA AGLAIA SAHRIZKY', '2', 'A'),
('180081', ' ANDARINI NAIRA PUTRI SUMARNO', '2', 'C'),
('180082', ' ANUGRAH PRIYO SEMBODO', '2', 'B'),
('180083', ' ARKAN THORIQ ANKHAFI', '2', 'A'),
('180084', ' AZKIYAH HANNA AQILA ESSA', '2', 'B'),
('180085', ' CHANDRA NUR AFDILLAH', '2', 'A'),
('180086', ' DAFFA ANGGINA HAMSAR ', '2', 'C'),
('180087', ' DARMAWAN NUZULISTYO', '2', 'A'),
('180088', ' DELISA ALANA YURI HAKIM', '2', 'C'),
('180089', ' DINDA NUR ZAHRA', '2', 'C'),
('180090', ' EARL LANDRA SHABIRA ANWAR', '2', 'A'),
('180091', ' FATHIYYAH SALSABILA', '2', 'B'),
('180093', ' HANUN  NUR KHOIRIYAH', '2', 'C'),
('180095', ' KHALISA RANIA PUTRI', '2', 'B'),
('180096', ' KRISNA AULIA SYAHID', '2', 'C'),
('180097', ' LANDRA FAIZA ALYA', '2', 'A'),
('180098', ' M. KIFLAN DJEILIE ZAMAKHSYARI ALDANI', '2', 'C'),
('180099', ' MUHAMMAD RAYYAN AL MAGHRIBY', '2', 'B'),
('180100', ' MUHAMMAD WILDAN ALDIANSYAH', '2', 'B'),
('180101', ' MUHAMMAD ARIYA AL MAGRIBI', '2', 'B'),
('180102', ' MUHAMMAD GHIFARI', '2', 'B'),
('180103', ' MUHAMMAD NIZAM MUMTAZ', '2', 'C'),
('180105', ' MUHAMMAD ZIDANE FAHREZIE', '2', 'C'),
('180106', ' NADINE KAEMA  ASYARIFA', '2', 'B'),
('180107', ' NATISHA HIZWAH IRAWAN', '2', 'B'),
('180108', ' NUR  AFILAH PUTRI NAIMA', '2', 'C'),
('180109', ' SYAUQIYAH AGNIELLYA JAWANI PUTRI', '2', 'B'),
('180111', 'NAHLA ASH SYALWA', '3', 'A'),
('180112', 'CHYKA REGINA RAMADHANI', '4', 'A'),
('180114', 'ANINDIA PUTRI OKTAVIANI', '5', 'A'),
('180115', 'AGHA ARCADIA OMAR KALEB', '4', 'C'),
('180116', 'SHAKILA PUTRI KOSASIH', '3', 'A'),
('190001', 'AHMAD FAUZI', '1', 'A'),
('190002', 'AMIRA OLIVIA AFIFAH', '1', 'A'),
('190003', 'ANANDA NABHAN FACHRUROZI', '1', 'A'),
('190004', 'AXELLO OTADAN WAHYUDI', '1', 'A'),
('190005', 'AYLLA AZZURA PUTRI', '1', 'A'),
('190006', 'AZKA RABBANI NASUTION', '1', 'A'),
('190007', 'AZZAM FADHIL MARZUQ', '1', 'A'),
('190008', 'BAARI ABIYU NUGROHO', '1', 'A'),
('190009', 'CARISSA MAZAYA AZ-ZHAFIR ALI', '1', 'A'),
('190010', 'DEMAS ARIF  SATRIANTORO', '1', 'A'),
('190011', 'ERLINDA PUSPITA SARI', '1', 'A'),
('190012', 'FACHRI PUTRA RIFAN', '1', 'A'),
('190013', 'FAJAR YAFIQ HAMIZAN', '1', 'A'),
('190014', 'FIKRI NAKHLA HAFIDZ', '1', 'A'),
('190015', 'HESSY DINDA KAMILA', '1', 'A'),
('190016', 'IBRAHIM AL FAUZI', '1', 'A'),
('190017', 'JANEETA AQILA WIDIHARDJA', '1', 'A'),
('190018', 'JENDRI ARKAN SIMATUPANG', '1', 'A'),
('190019', 'KAHILA AURANI SUMARDI', '1', 'A'),
('190020', 'KAYLA KABILLAH ISMAIL', '1', 'A'),
('190021', 'KEENAN RADITYA SANTOSO', '1', 'C'),
('190022', 'MUHAMMAD FARIDUDIN ATHOR', '1', 'A'),
('190023', 'NAHDAH NUR FAWWAZ', '1', 'A'),
('190024', 'NAILA GHAIZANI DINNISA', '1', 'A'),
('190025', 'RAISSA ZANETHA SYAWALI', '1', 'A'),
('190026', 'RAINA LEONA RAHMADINA', '1', 'A'),
('190027', 'REINO MUFID PRIANDIKA', '1', 'A'),
('190028', 'RUMMAN REZA ABDAT', '1', 'A'),
('190029', 'SELLY AMELIA RAMADHANI', '1', 'A'),
('190030', 'SAFA  RAMDHAN', '1', 'A'),
('190031', 'SYAKIRAH DWI YUNIARTI', '1', 'A'),
('190032', 'SYIFA JANEETA EDWARDO', '1', 'A'),
('190033', 'TIFFANY FAEZZY RAGANATA', '1', 'A'),
('190034', 'ZEVA ABIDUNNAFIS', '1', 'A'),
('190035', 'ABIYATHAR FATTAH MAULANA', '1', 'B'),
('190036', 'AFIFAH KHAIRANI', '1', 'B'),
('190037', 'AIMAR  SHAKA ALBIRUNI', '1', 'B'),
('190038', 'AISYAH DEWI CANDANI', '1', 'B'),
('190039', 'APTANA AGASTHYA DAKARAI', '1', 'B'),
('190040', 'AQILLA NAURA PUTRI', '1', 'B'),
('190041', 'ARIF UMAR ALI ZULFIKAR', '1', 'B'),
('190042', 'ATHAYA  ZAHIRA ALIY', '1', 'B'),
('190043', 'AZKIYA KHOIRUNNISA', '1', 'B'),
('190044', 'DAIYAN GHANIM RAMADHAN', '1', 'B'),
('190045', 'DARVESH KAY KAUS HABIBIE', '1', 'B'),
('190046', 'ERLANGGA KAISAR ALFARIZKI', '1', 'B'),
('190047', 'FAYYAZ MALIKA AKBAR', '1', 'B'),
('190048', 'GENDHIS AZZAHRA LARASSATI', '1', 'B'),
('190049', 'GHAISAN ATHAR PUTRA WIDYANARKO', '1', 'B'),
('190050', 'GHIFAR ACHMAD HAFIDZI', '1', 'B'),
('190051', 'KAYYISAH VANIA RIZQI', '1', 'B'),
('190052', 'KHANSA RENTYANA ADIZKA', '1', 'B'),
('190053', 'MOHAMMAD AKHTAR RABBANI', '1', 'B'),
('190054', 'MUHAMMAD ATHALARIQ PRADANA', '1', 'B'),
('190055', 'MUHAMMAD RIZKY SULAIMAN', '1', 'B'),
('190056', 'NABILA IZZATUNNISA YAMANI', '1', 'B'),
('190057', 'NAFIS ABDUL KHAKIM', '1', 'B'),
('190058', 'NINDITA GHASSANI PUTRI', '1', 'B'),
('190059', 'PANDU EKA PUTRA', '1', 'B'),
('190060', 'RACHEL MUTIARA RAMADHANI', '1', 'B'),
('190061', 'RADEN QUINSHA MUTIARA ADJIE', '1', 'B'),
('190062', 'RAIHAN MADIA PUTRA', '1', 'B'),
('190063', 'ROHMAT INGPANDITA', '1', 'B'),
('190064', 'UMI ZAHRA', '1', 'B'),
('190065', 'VANIA LINTANG KIRANA', '1', 'B'),
('190066', 'ZAHIRA NUFAIL SABRINA', '1', 'B'),
('190067', 'ZHENA ADINDA GIGANTARA', '1', 'B'),
('190068', 'ANANDA MUHAMMAD BINTANG PRATAMA', '1', 'C'),
('190069', 'ANDARA NAYSILA AZZAHRA', '1', 'C'),
('190070', 'ANDRE SUSANTO', '1', 'C'),
('190071', 'AUDY MAULIDA IRHAZ', '1', 'C'),
('190072', 'AZKA  MIFZAL SYAFID', '1', 'C'),
('190073', 'CAILAH  RAZITA FAJAR', '1', 'C'),
('190074', 'FAIRELL ATHAR RIZQI', '1', 'C'),
('190075', 'FAWWAZ ALHUDA', '1', 'C'),
('190076', 'FIRZA ARKANANTA', '1', 'C'),
('190077', 'HAZHIYAH NABIL GHASSANI', '1', 'C'),
('190078', 'KANAYA NUR HAFEEZA', '1', 'C'),
('190079', 'KARUNIA FADHIL ATAHILAH', '1', 'C'),
('190080', 'KESYA FAWWAS ALFAIZI', '1', 'C'),
('190081', 'MAHIRAH  HAFIDZ  ZEIN', '1', 'C'),
('190082', 'MARVA ATTHAYA AHZA', '1', 'C'),
('190083', 'MUHAMMAD AL-FATIH GHANI', '1', 'C'),
('190084', 'MUHAMAD ASKHAN TEGAR', '1', 'C'),
('190085', 'MUHAMMAD GIBRAN PUTRA MARWANTO', '1', 'C'),
('190086', 'MUHAMMAD HUSEIN ABDILLAH', '1', 'C'),
('190087', 'NAFI\'AH TSABITA', '1', 'C'),
('190088', 'NAJWARAHMAH', '1', 'C'),
('190089', 'NAUFAL FADIL', '1', 'C'),
('190090', 'NAYLA NABILLAH ISMAIL', '1', 'C'),
('190091', 'RADEN FAWWAZ WIDHANA', '1', 'C'),
('190092', 'RANA CLEA DESVANA', '1', 'C'),
('190093', 'RAISSA MAHESWARI WARDA', '1', 'C'),
('190094', 'SALSABILLA ALFIYATURROHHMAH PUTRI WAHYUDI', '1', 'C'),
('190095', 'SASHIKIRANA PUTRI WIBISONO', '1', 'C'),
('190096', 'SATRIA MUSTOFA HAKAR', '1', 'C'),
('190097', 'SHERANA ARRISA RIZWANA', '1', 'C'),
('190098', 'VINA RAMADHANI', '1', 'C'),
('190099', 'YASIN MAULANA', '1', 'C'),
('190100', 'YASMIN CHOLID MAR\'I', '1', 'C'),
('190101', 'DAFANIA ANAYA', '1', 'B'),
('190102', 'BANU APRILIYO SAPUTRO', '4', 'B'),
('190103', ' HILYATUSSU`ADAH', '2', 'B'),
('190104', 'MUHAMMAD RIDHO ILLAHI', '5', 'C'),
('190105', 'ARDELLIO ATTHALLA', '4', 'C'),
('190107', 'AL LAMAN GITARA DIPATI PRATAMA', '1', 'A'),
('190108', 'NABILA MUTIARA', '3', 'A'),
('190109', 'RIZKA SUKMA ANDINI', '4', 'B'),
('3599', 'AZKA  AMMAR LUDY', '6', 'C'),
('3696', 'ABDUL JALAL JAYLANI', '6', 'B'),
('3697', 'ABID WILDAN SAPUTRO', '6', 'C'),
('3700', 'ADIFA RAMA HAIKAL', '6', 'C'),
('3702', 'AISYAH RACHMAT', '6', 'C'),
('3704', 'AMIRA HASNA KAMILA', '6', 'B'),
('3707', 'FATHIA ALYA SYAFA', '6', 'A'),
('3708', 'FATUR RAHMAN ALFAREZZY', '6', 'A'),
('3709', 'HANNA HAZRINA HADI', '6', 'C'),
('3711', 'HURIYAH BUNGA KINANTI', '6', 'B'),
('3713', 'KAMILA MARSYA NURADZRA NUGRAHA', '6', 'C'),
('3714', 'MAHESHA WIRA AKBAR MAULANA', '6', 'A'),
('3715', 'MUHAMAD FAZIL FAUZI', '6', 'A'),
('3716', 'MUHAMMAD AL HAFIS', '6', 'B'),
('3717', 'MUHAMMAD FAIZ DWI OKTAFIANTO', '6', 'B'),
('3718', 'MUHAMMAD HANIF FADLURRAHMAN', '6', 'B'),
('3719', 'MUHAMMAD MUKZIE ARIEFANDIKRAMA', '6', 'C'),
('3721', 'MUHAMMAD ZIDANE PRATAMA', '6', 'A'),
('3722', 'MUTIA FEBRIYANA', '6', 'C'),
('3723', 'NABILA DWI LESTARI', '6', 'A'),
('3727', 'SALSABILLA ATHAFUNISSA', '6', 'A'),
('3728', 'SITI FATHUROHMAH', '6', 'A'),
('3729', 'SYARYFAH NABILA ALHADAD', '6', 'C'),
('3730', 'ZAFIRA PUTRI RAMADHANI', '6', 'B'),
('3731', 'AHMAD RAIHAN SYA\'BANI', '6', 'C'),
('3733', 'ANGGUN HADI NIHAYAH', '6', 'B'),
('3734', 'ARLIA WIDYARTI WIBOWO', '6', 'A'),
('3735', 'AUFAA ZAHRAH ALINDINA', '6', 'B'),
('3736', 'DINAR MAHARANI', '6', 'B'),
('3737', 'DINDA CHAIRUNNISA NURSARI', '6', 'B'),
('3738', 'FADILAH NUR AZIS ARSYADHANI', '6', 'C'),
('3739', 'FARRAS NUR ALAMY CIPTA', '6', 'B'),
('3740', 'FATHIR AMIRULLAH TRIPUTRA', '6', 'A'),
('3741', 'HAFIZH HERDIANSYAH', '6', 'B'),
('3742', 'HEIDI PUTRI PRADISA', '6', 'C'),
('3743', 'HILYATUL AULIA', '6', 'A'),
('3744', 'IMAM ALI PASYA', '6', 'A'),
('3745', 'KEYSYABRINA AZIZZAH USZMA', '6', 'B'),
('3748', 'MUHAMAD NABIL ZAHWAN NUR ARDIYANTO', '6', 'C'),
('3750', 'MUHAMMAD FAKHRI HUSAINI', '6', 'C'),
('3751', 'MUHAMMAD HAZAMI', '6', 'A'),
('3754', 'NAIRA CHAERUNNISA', '6', 'B'),
('3755', 'NATASHA RIZKY RAMADHANTI', '6', 'A'),
('3756', 'NAUFAL RAIHAN ABDULLAH', '6', 'C'),
('3757', 'NAZHIRA AZKA AMINUDIN', '6', 'A'),
('3758', 'NAZWA AGNISSA HAMIDAH', '6', 'A'),
('3759', 'PUTRA RIZKY PRATAMA', '6', 'B'),
('3760', 'RENDY DWI SAPUTRA', '6', 'C'),
('3761', 'SABITA NUR FADHILAH', '6', 'A'),
('3762', 'SALMA QONITA', '6', 'A'),
('3763', 'SYAVINKA ZAHARANI RACHMAN', '6', 'A'),
('3764', 'ZAHRA TUSYITA ', '6', 'C'),
('3765', 'AFRIEZAR RADITYA ARIELLA', '6', 'B'),
('3766', 'AGHNIA PUTRI ROFIDAH', '6', 'A'),
('3768', 'AMELIA ARDANI', '6', 'A'),
('3769', 'AQILAH YUNIAR ', '6', 'A'),
('3770', 'ATHIFA RADITHYA DWI ANANDA', '6', 'B'),
('3771', 'AYYASH ABDURRAHMAN', '6', 'C'),
('3773', 'DEVI ARYANI', '6', 'B'),
('3774', 'DORIAN FAUZAN TIRTAKUSUMAH', '6', 'A'),
('3776', 'FATHIYA SALMA HAFIZHA', '6', 'C'),
('3778', 'HESSY ANDEVA', '6', 'A'),
('3781', 'KAGUMI AISYAH PUTRI', '6', 'B'),
('3783', 'MUHAMAD NABIL ALHADAD', '6', 'C'),
('3784', 'MUHAMMAD ALIF RAHLIL RAMADHAN', '6', 'B'),
('3785', 'MUHAMMAD FARREL SUCI RAMADHAN', '6', 'B'),
('3786', 'MUHAMMAD HIRZI ILYAS RIYANTO', '6', 'A'),
('3787', 'MUHAMMAD ZIDANE', '6', 'C'),
('3789', 'NAURA KALLISTA FADANTHYA', '6', 'A'),
('3790', 'PAHMI AHMAD MADANI', '6', 'A'),
('3791', 'PRIATY GIESYA AURALINA', '6', 'C'),
('3792', 'RADAFA ARKHANSYAH', '6', 'B'),
('3793', 'RANDY YARISTINO', '6', 'B'),
('3794', 'REFA MAHARANI FRITAMA', '6', 'B'),
('3795', 'RIVALDY NABIL ATMADIMADJA', '6', 'B'),
('3796', 'SITI NUR KHASANAH', '6', 'C'),
('3797', 'TIARA PUTTI RAMADHANY', '6', 'A'),
('3801', 'GILANG NURSENJA', '6', 'A'),
('3802', 'ATHIA', '6', 'C'),
('3806', 'ADJIE PRASETYO', '5', 'B'),
('3807', 'AHMAD AZIZ SYAHREZA', '5', 'B'),
('3808', 'AHMAD RAIYHAN ABDILLAH', '5', 'B'),
('3809', 'AHMAD SYAUQIE', '5', 'C'),
('3810', 'AISHA PUTRI', '5', 'B'),
('3811', 'AISYAH AMIRA MADIA', '5', 'B'),
('3812', 'ALBAIT INDAFIQ SAPUTRO', '5', 'C'),
('3813', 'ALISA MEYLA ALMIRA', '5', 'C'),
('3814', 'ANDINI ALESYA', '5', 'A'),
('3815', 'ARWAN RIDHO PRATAMA', '5', 'B'),
('3816', 'ARYA ABDULLAH', '5', 'C'),
('3817', 'AZALEA JANNAH', '5', 'C'),
('3818', 'AZKA REFLIAN PUTRA', '5', 'B'),
('3819', 'BIMA PANDU WICAKSONO', '5', 'A'),
('3820', 'CALLISTA AURADHITYA', '5', 'B'),
('3821', 'CANTIKA NUR RIZKI', '5', 'A'),
('3822', 'DEVINA RAHMA PUTRI', '5', 'B'),
('3823', 'DHIMAS ADHI PRAMANA', '5', 'C'),
('3825', 'DINDA SAFIRA AULIA NUR ROSADI', '5', 'A'),
('3826', 'DIO HAFIZ RAHMADHIKA', '5', 'B'),
('3827', 'EKA DIVA ALMIRA KURNIA', '5', 'C'),
('3828', 'ELHAMD DZAKI ATTHARIQ', '5', 'C'),
('3829', 'EZAR NAJIB NUGROHO', '5', 'B'),
('3830', 'FADLY KHOIRUL ERVIANSYAH', '5', 'B'),
('3832', 'FAJAR FEBRYANTO', '5', 'A'),
('3833', 'FAJRIN WILLIS ALLATIF', '5', 'A'),
('3834', 'FATHAN RIZKY MUBINA', '5', 'C'),
('3835', 'FATTAN NUR AZMI', '5', 'A'),
('3836', 'FIKRIA AZZAHRA', '5', 'A'),
('3837', 'FIRYAL SAKHI AULIA ALI', '5', 'B'),
('3838', 'HADIANSYAH RAHIM', '5', 'C'),
('3839', 'HAFIZ ZUR RIZIQ', '5', 'B'),
('3840', 'HASAN ALMUSTHOFA', '5', 'B'),
('3841', 'IZZAH TSABITA QOLBI', '5', 'A'),
('3842', 'JIHAN HASNA HUMAIRA', '5', 'C'),
('3843', 'KAYLA NATANIA', '5', 'B'),
('3844', 'KAYRA AURELLIA PATURUSSI', '5', 'B'),
('3846', 'KHARINA HAMIDA ZAHRA', '5', 'C'),
('3847', 'KHOIRUN NISA', '5', 'A'),
('3848', 'KIRANA EL-ZAHIRA FAUZI', '5', 'B'),
('3849', 'KLARISA MAULINA AGUSTIN', '5', 'B'),
('3850', 'KUKUH PRIA KABARESI', '5', 'B'),
('3851', 'LIVIO DEREL MURTAZA', '5', 'C'),
('3852', 'LOUBNA ALBY HANEESA', '5', 'B'),
('3853', 'LUSY RAHMAYANTI', '5', 'B'),
('3854', 'MARISSA FAUZI DERMAWAN', '5', 'B'),
('3855', 'MUZHHIRUL HAQ', '5', 'B'),
('3856', 'MUFI PRADENA PUTRI', '5', 'C'),
('3857', 'MUHAMMAD VINZA PUTRA MAHESHA', '5', 'C'),
('3858', 'MUHAMAD RIZKI AKBAR', '5', 'C'),
('3859', 'MUHAMMAD CHESTA HARDIONA', '5', 'B'),
('3860', 'MUHAMMAD FAEYZA ARDIANZA', '5', 'A'),
('3861', 'MUHAMMAD HAYKAL FIKRI', '5', 'A'),
('3862', 'MUHAMMAD IBNU FAUZI', '5', 'A'),
('3865', 'MUHAMMAD RAFI', '5', 'A'),
('3866', 'MUHAMMAD RAFI FAUZAN', '5', 'A'),
('3867', 'MUHAMMAD REZA TAUFIK NOER', '5', 'A'),
('3868', 'MUHAMMAD WILDAN ZUHAIR', '5', 'C'),
('3869', 'MUHAMMAD ZAIN NIZAM', '5', 'B'),
('3870', 'MUHAMMAD ZAKI YAMANI', '5', 'C'),
('3871', 'NABIL AKBAR MUSYARIF', '5', 'A'),
('3872', 'NADYA PUTRI RAMADHANI', '5', 'C'),
('3873', 'NAHDA HAYYINA ZULFA', '5', 'A'),
('3875', 'NAJWA FARIZA HUTABARAT', '5', 'C'),
('3876', 'NASUHA AULIA', '5', 'C'),
('3877', 'NAUFAL MUHAMMAD AIDIL `AZIZ', '5', 'C'),
('3879', 'NAZWA CHALISTA PUTRI', '5', 'A'),
('3880', 'NEZRA HAUNA ADNI SYAMIKA HARAHAP', '5', 'A'),
('3881', 'NISRINA ABYAN ZAINAL', '5', 'A'),
('3883', 'QEYSA AINUN QOLBI', '5', 'C'),
('3884', 'RAFASYAH SATRIA NUGROHO', '5', 'A'),
('3885', 'RAFFAIQ ALFARIZA FIRMANSYAH', '5', 'B'),
('3886', 'RAFI RIFALDI', '5', 'C'),
('3887', 'RAIHAN EKARINO', '5', 'C'),
('3888', 'RAIHAN DIMAS FIDRIANTO', '5', 'A'),
('3889', 'RAYFA ARISNA PRATAMA', '5', 'C'),
('3890', 'RAYI TRICAHYA ATMIARTI', '5', 'C'),
('3891', 'REFAEL MAULANA', '5', 'C'),
('3893', 'SASQIA EKA NATARINA', '5', 'C'),
('3894', 'SUBHAN EDI WICAKSONO', '5', 'A'),
('3896', 'SYAFIRA AZZAHRA', '5', 'B'),
('3897', 'SYAFIRA HANDAYANI', '5', 'C'),
('3899', 'SYAHLA RAESHITA ANAYA', '5', 'A'),
('3901', 'TREYHAN NAUFAL ZAKKIY', '5', 'A'),
('3902', 'VIRSYA DINA AL KAFFAH', '5', 'B'),
('3903', 'YASMIN MELIA PUTRI', '5', 'B'),
('3905', 'ZAHRA SAHIDATUN NISA', '5', 'A'),
('3906', 'ZIVANNA RAMANIYA IBRAHIM', '5', 'B'),
('3914', 'ADELIA ANANDA', '4', 'B'),
('3915', 'ANANDA RAFA RAMADHAN', '4', 'B'),
('3916', 'ANNISA MAHARANI', '4', 'B'),
('3917', 'ANNUR ROSYID WIJAYA KUSUMA', '4', 'A'),
('3919', 'ARSYAD ZAIDAN PRATAMA', '4', 'C'),
('3920', 'AULIA MURDIANI', '4', 'B'),
('3921', 'AZKIYA NURIL ALFIAH', '4', 'C'),
('3923', 'FARDHA MUFIDAH', '4', 'C'),
('3924', 'FEBRISTA ABIGELIANTI', '4', 'C'),
('3925', 'FEISHA NAFESA RAHMAN', '4', 'A'),
('3926', 'JIHAN PUTRI FATSY', '4', 'C'),
('3927', 'KADITA AURA PUTRI', '4', 'A'),
('3928', 'MUHAMAD ANDIKA RAHMAN', '4', 'C'),
('3929', 'MUHAMMAD IRSYAD NASUTION', '4', 'A'),
('3930', 'MUHAMMAD MAHADHIR RAJAB', '4', 'C'),
('3932', 'MUHAMMAD RASYA BANU AFKARI', '4', 'B'),
('3933', 'MUHAMMAD ZIDAN GAZALI HARIS', '4', 'A'),
('3934', 'NAHDAN RASYIDAN AMINUDIN', '4', 'B'),
('3935', 'NALENDRA FAHRY IRAWAN', '4', 'C'),
('3936', 'NAZMI RASYIDAN AMINUDIN', '4', 'B'),
('3937', 'RAFIQI JAMIL FARRAS', '4', 'A'),
('3938', 'REZA ZAINUDDIN', '4', 'B'),
('3939', 'RIDHO SETIAWAN', '4', 'B'),
('3940', 'RIMBA RAYA RABBANI', '4', 'B'),
('3941', 'SEKAR AJENG RAISYA NOOR', '4', 'C'),
('3942', 'SIDIQ FATHURAHMAN ABDIWIYONO', '4', 'A'),
('3943', 'SYAFA AULIA PUTRI', '4', 'C'),
('3944', 'SYARFA FIRZANAH IRDA', '4', 'B'),
('3945', 'TSABITA REHANI FIRDAUSI', '4', 'C'),
('3947', 'ZAAHIRAH AMELLYA', '4', 'C'),
('3948', 'ZAFIRA HASAN', '4', 'C'),
('3949', 'AFRIDHAN ILHAM IMAWAN PUTRA', '4', 'A'),
('3950', 'AHMAD NASYWAN HAKIM', '4', 'A'),
('3951', 'ALYA NASYWA RACHMI PUTRI', '4', 'C'),
('3955', 'ANUGRAH AKMAL SAPUTRA', '4', 'A'),
('3956', 'ARYASATYA KHENJI SOEMARNO', '4', 'B'),
('3957', 'AULIA AZZAHRA SYAHPUTRI', '4', 'C'),
('3958', 'AULIA MAWARDI PUTRI', '4', 'A'),
('3959', 'AZKA IBRAHIM RAHARDYAN', '4', 'C'),
('3960', 'CLEOSA AGASTYA ARSA', '4', 'C'),
('3961', 'DEWANTY PUTRI SWASTIYA', '4', 'B'),
('3963', 'EGI ADITHIA PRATAMA', '4', 'A'),
('3964', 'EKA WIDIANINGSIH', '4', 'B'),
('3966', 'GEMMA ZAYYAN MUMTAZ', '4', 'C'),
('3967', 'IBNATY QAISHARAH ALVIADI', '4', 'B'),
('3968', 'IBNU BRILLIANT QALBI', '4', 'C'),
('3969', 'KEVIN RABBANI DEVINO HAZMIRSJAM', '4', 'C'),
('3970', 'LINTANG ALVINO', '4', 'C'),
('3971', 'LIYANA', '4', 'B'),
('3972', 'MUHAMAD FAQIH PUTRA AGASSI', '4', 'B'),
('3973', 'MUHAMAD RIZKI ABDILLAH', '4', 'C'),
('3974', 'MUHAMMAD AFDHAL ABDALAH', '4', 'C'),
('3975', 'MUHAMMAD HUSAIN', '4', 'A'),
('3976', 'MUHAMMAD IBNU KATSIR', '4', 'A'),
('3977', 'NAURA PUTRI RAMADHANI', '4', 'C'),
('3978', 'QUINSHA AFIDATUL QUDSIYAH', '4', 'A'),
('3979', 'RADINKA RIFQI AQILAH', '4', 'C'),
('3980', 'RAYHAN FATIN PASHA', '4', 'C'),
('3981', 'RENDRA AHMAD HAIKAL', '4', 'A'),
('3982', 'SULTAN RIZQI ABDILLAH PURNAMAWARDHANA', '4', 'B'),
('3983', 'WISNU HARYO WIBISONO', '4', 'C'),
('3984', 'ZIYAN KEYSYA AMEERA SULHA', '4', 'C'),
('3985', 'AESYAR ALI', '4', 'A'),
('3986', 'AISYAH HILYA AULIA ESSA', '4', 'C'),
('3988', 'ANDI HARLINO', '4', 'C'),
('3989', 'ARINI DIAH ARIANTY', '4', 'A'),
('3990', 'BUNGA PUSPITA KENCANA', '4', 'A'),
('3992', 'CARISSA AGHNI MEDINA', '4', 'A'),
('3993', 'DWI RIKHADATUL A`ISY', '4', 'B'),
('3994', 'ELYAZID ZIDANE', '4', 'B'),
('3995', 'FABYAN BAHRI', '4', 'C'),
('3996', 'FARIS AKMAL RAMADHAN', '4', 'C'),
('3998', 'IBRAHIM AGUNG DWI LINAMATO', '4', 'B'),
('4001', 'LITA KURNIA SARI', '4', 'A'),
('4002', 'LULU SYAKIRA ALATAS', '4', 'B'),
('4004', 'MUAMAR KHADAFI', '4', 'B'),
('4006', 'MUHAMMAD ALIF REVANSYAH', '4', 'B'),
('4007', 'MUHAMMAD BANI RAMADHON', '4', 'A'),
('4008', 'NABILA KHOLILAH HAKAR', '4', 'B'),
('4010', 'NAYLA ALMA PRAMESTI', '4', 'A'),
('4011', 'RAFI HAFIZH', '4', 'A'),
('4012', 'RASHIF WILDAN ARROFI', '4', 'A'),
('4013', 'RIZKY AMALIE KEYSHA', '4', 'A'),
('4014', 'SITI KHOIRINNISSA', '4', 'A'),
('4015', 'SOLEHUDDIN', '4', 'B'),
('4017', 'TEUKU MUHAMMAD HAIKAL ', '4', 'A'),
('4018', 'ZAKARIA FA`IZ', '4', 'A'),
('4024', 'MUHAMMAD YUSUF ADYTHIA', '6', 'C'),
('4025', 'ABDULLAH RAMADHANI FIRDAUS', '5', 'A'),
('4026', 'MUHAMMAD FAIRUZ ARDHI', '5', 'B'),
('4027', 'NOVI ARISTA PRAYONO', '5', 'B'),
('4028', 'SYIFA AWWALIYAH', '5', 'A'),
('4029', 'KHANSA RUMAISHA', '5', 'B'),
('4030', 'NURUL AINI ANJANI', '5', 'C'),
('4032', 'DYKA DEANDRA', '5', 'A');

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
('1', '2019/2020');

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
  MODIFY `id_pembayaran` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
